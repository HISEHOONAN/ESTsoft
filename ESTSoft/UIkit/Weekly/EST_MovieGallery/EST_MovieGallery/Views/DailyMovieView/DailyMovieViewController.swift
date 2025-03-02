//
//  DailyViewController.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 2/28/25.
//

import UIKit
import SnapKit
import Moya

class DailyViewController : UIViewController {
    
    let dailyMovie
    
    //MARK: - Properties
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "일별 박스 오피스"
        label.font = DesignSystemFont.Pretendard_Bold30.value
        return label
    }()
    
    private let dailyTableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .yellow
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
        dailyTableView.dataSource = self
        dailyTableView.delegate = self
        dailyTableView.rowHeight = UITableView.automaticDimension
        dailyTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    private func SetUI(){
        
        view.addSubviews(titleLabel,dailyTableView)
        
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        dailyTableView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
    }
}

extension DailyViewController : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DailyTableViewCell", for: indexPath) as? DailyTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    
}

#Preview {
    DailyViewController()
}
