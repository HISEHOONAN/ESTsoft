//
//  DailyTableViewCell.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 3/1/25.
//
import UIKit
import SnapKit

class DailyTableViewCell : UITableViewCell {
    
    //MARK: - properties
    lazy var cellView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var RankLabel : UILabel = {
        let label = UILabel()
        label.font = DesignSystemFont.Pretendard_Bold30.value
        label.textColor = .black
        return label
    }()
    
    lazy var newLabel : UILabel = {
        let label = UILabel()
        label.font = DesignSystemFont.Pretendard_Bold18.value
        label.textColor = .systemYellow
        return label
    }()
    
    lazy var movieLabel : UILabel = {
        let label = UILabel()
        label.font = DesignSystemFont.Pretendard_Bold18.value
        return label
    }()
    
    lazy var openDtLabel : UILabel = {
        let label = UILabel()
        label.font = DesignSystemFont.Pretendard_Bold18.value
        return label
    }()
    
    let posterView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "estsoft")
        view.layer.borderColor = UIColor.blue.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 25
        return view
    }()
    
    //MARK: - Lift Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUI()
    }
    
    //MARK: - setUI
    
    func setUI(){
        contentView.layer.cornerRadius = 8
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 8))
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        contentView.addSubviews(cellView)
        cellView.addSubviews(movieLabel,RankLabel,newLabel,openDtLabel,posterView)
        
        cellView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        movieLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(RankLabel.snp.bottom).offset(4)
        }
        
        RankLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().offset(16)
        }
        
        newLabel.snp.makeConstraints{
            $0.leading.equalTo(RankLabel.snp.trailing).offset(16)
            $0.centerY.equalTo(RankLabel)
        }
        openDtLabel.snp.makeConstraints{
            $0.top.equalTo(movieLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
        }
        posterView.snp.makeConstraints{
            $0.top.equalTo(openDtLabel.snp.bottom).offset(16)
            $0.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }
}
