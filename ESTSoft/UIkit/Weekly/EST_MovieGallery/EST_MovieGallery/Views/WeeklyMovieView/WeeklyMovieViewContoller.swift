//
//  WeeklyViewContoller.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 2/28/25.
//

import UIKit
import SnapKit
import Moya

class WeeklyViewContoller : UIViewController {
    
    //MARK: - Properties
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "주간 박스 오피스"
        label.font = DesignSystemFont.Pretendard_Bold30.value
        return label
    }()
    
    private let weeklyTableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .green
        return tableView
    }()
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        SetUI()
        SetTable()
    }
    
    //MARK: - SETUI
    private func SetTable(){
        weeklyTableView.dataSource = self
        weeklyTableView.delegate = self
        weeklyTableView.rowHeight = UITableView.automaticDimension
        weeklyTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    private func SetUI(){
        
        view.addSubviews(titleLabel,weeklyTableView)
        
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        weeklyTableView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}

extension WeeklyViewContoller : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeeklyTableViewCell", for: indexPath) as? WeeklyTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    
}
#Preview {
    WeeklyViewContoller()
}
