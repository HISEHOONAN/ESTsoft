//
//  DailyViewController.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 2/28/25.
//

import UIKit
import SnapKit
import Moya
import Combine

class DailyViewController : UIViewController {
    
    private var cancellables: Set<AnyCancellable> = []
    
    private let viewModel = ViewModel.shared
    
    //MARK: - Properties
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "일별 박스 오피스"
        label.font = DesignSystemFont.Pretendard_Bold30.value
        return label
    }()
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .compact // iOS 스타일에 맞게 조정 가능
        picker.locale = Locale(identifier: "ko_KR") // 한국 날짜 형식 적용
        picker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        return picker
    }()
    
    private let dailyTableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    
    private let emptyLabel : UILabel = {
        let label = UILabel()
        label.text = "어제 날짜부터 조회가 가능합니다.\n위에 날짜를 선택해주세요."
        label.font = DesignSystemFont.Pretendard_Bold30.value
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        SetUI()
        getDaily()
        SetTable()
    }
    
    //MARK: - SETUI
    private func SetTable(){
        dailyTableView.dataSource = self
        dailyTableView.delegate = self
        dailyTableView.rowHeight = UITableView.automaticDimension
        dailyTableView.estimatedRowHeight = UITableView.automaticDimension
        dailyTableView.register(DailyTableViewCell.self, forCellReuseIdentifier: "DailyTableViewCell")
        dailyTableView.separatorStyle = .none
        
    }
    
    private func checkempty(){
        if viewModel.DailyMovieList.isEmpty{
            dailyTableView.isHidden = true
            emptyLabel.isHidden = false
        }else{
            emptyLabel.isHidden = true
            dailyTableView.isHidden = false
        }
    }
    
    private func SetUI(){
        
        view.addSubviews(titleLabel,dailyTableView,datePicker,emptyLabel)
        
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        dailyTableView.snp.makeConstraints{
            $0.top.equalTo(datePicker.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(100)
        }
        datePicker.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        emptyLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
    }
    
    //MARK: - API
    func getDaily(){
        viewModel.$selectedDate
            .removeDuplicates() // 같은 날짜로 중복 호출 방지
            .sink { [weak self] newDate in
                self?.viewModel.getDailyMovie(targetDt: newDate)
            }
            .store(in: &cancellables)
        
        viewModel.$DailyMovieList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.dailyTableView.reloadData()
                self?.checkempty()
            }
            .store(in: &cancellables)
        
    }
    
    //MARK: - @objc func
    @objc private func dateChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        viewModel.selectedDate = formatter.string(from: sender.date)
    }
    
}

extension DailyViewController : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.DailyMovieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DailyTableViewCell", for: indexPath) as? DailyTableViewCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        
        cell.movieLabel.text = viewModel.DailyMovieList[indexPath.row].movieNm
        
        cell.RankLabel.text = viewModel.DailyMovieList[indexPath.row].rank
        
        if viewModel.DailyMovieList[indexPath.row].rankOldAndNew.rawValue != "OLD" {
            cell.newLabel.text = "NEW"
        }
        
        cell.openDtLabel.text = "개봉일 : " + viewModel.DailyMovieList[indexPath.row].openDt
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.getDetailMovie(movieCd: viewModel.DailyMovieList[indexPath.row].movieCD) {
            DispatchQueue.main.async {
                let vc = DetailViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    
}

#Preview {
    DailyViewController()
}
