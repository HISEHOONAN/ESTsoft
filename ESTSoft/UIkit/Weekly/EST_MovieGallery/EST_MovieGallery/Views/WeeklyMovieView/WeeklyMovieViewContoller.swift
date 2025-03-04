//
//  WeeklyViewContoller.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 2/28/25.
//

import UIKit
import SnapKit
import Moya
import Combine

class WeeklyViewContoller : UIViewController {
    
    private var cancellables: Set<AnyCancellable> = []
    
    private let viewModel = ViewModel.shared
    
    //MARK: - Properties
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "주간 박스 오피스"
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
    
    private let weeklyTableView : UITableView = {
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
        SetTable()
        getWeekly()
    }
    
    //MARK: - SETUI
    private func SetTable(){
        weeklyTableView.dataSource = self
        weeklyTableView.delegate = self
        weeklyTableView.rowHeight = UITableView.automaticDimension
        weeklyTableView.estimatedRowHeight = UITableView.automaticDimension
        weeklyTableView.register(WeeklyTableViewCell.self, forCellReuseIdentifier: "WeeklyTableViewCell")
        weeklyTableView.separatorStyle = .none
    }
    
    private func SetUI(){
        view.addSubviews(titleLabel,weeklyTableView,datePicker,emptyLabel)
        
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        weeklyTableView.snp.makeConstraints{
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
    
    private func checkempty(){
        if viewModel.WeeklyMovieList.isEmpty{
            weeklyTableView.isHidden = true
            emptyLabel.isHidden = false
            
        }else{
            emptyLabel.isHidden = true
            weeklyTableView.isHidden = false
        }
    }
    
    //MARK: - API
    func getWeekly(){
        viewModel.$selectedDate
            .removeDuplicates() // 같은 날짜로 중복 호출 방지
            .sink { [weak self] newDate in
                self?.viewModel.getWeeklyMovie(targetDt: newDate)
            }
            .store(in: &cancellables)
        
        viewModel.$WeeklyMovieList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.weeklyTableView.reloadData()
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

extension WeeklyViewContoller : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.WeeklyMovieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeeklyTableViewCell", for: indexPath) as? WeeklyTableViewCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        cell.movieLabel.text = viewModel.WeeklyMovieList[indexPath.row].movieNm
        cell.RankLabel.text = viewModel.WeeklyMovieList[indexPath.row].rank
        if viewModel.WeeklyMovieList[indexPath.row].rankOldAndNew.rawValue != "OLD" {
            cell.newLabel.isHidden = false
            cell.newLabel.text = "NEW"
        }else{
            cell.newLabel.isHidden = true
        }
        cell.openDtLabel.text = "개봉일 : " + viewModel.WeeklyMovieList[indexPath.row].openDt
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.getDetailMovie(movieCd: viewModel.WeeklyMovieList[indexPath.row].movieCD){
            DispatchQueue.main.async {
                let vc = DetailViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

#Preview {
    WeeklyViewContoller()
}
