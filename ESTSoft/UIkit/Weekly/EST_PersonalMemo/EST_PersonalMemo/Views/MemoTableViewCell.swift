//
//  MemoTableViewCell.swift
//  EST_PersonalMemo
//
//  Created by 안세훈 on 3/8/25.
//

import UIKit
import SnapKit

class MemoTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = DesignSystemFont.Pretendard_Bold16.value
        label.textColor = .black
        return label
    }()
    
    let memoLabel: UILabel = {
        let label = UILabel()
        label.font = DesignSystemFont.Pretendard_Medium14.value
        label.textColor = .darkGray
        label.numberOfLines = 2
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = DesignSystemFont.Pretendard_Medium12.value
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.backgroundColor = .systemGray5
        return imageView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowRadius = 4
        return view
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        containerView.addSubviews(titleLabel, memoLabel, dateLabel, thumbnailImageView)
        
        containerView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        thumbnailImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(60)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().offset(-12)
        }
        
        memoLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().offset(-12)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(memoLabel.snp.bottom).offset(4)
            $0.trailing.equalToSuperview().offset(-12)
            $0.bottom.equalToSuperview().offset(-12)
        }
    }
    
    // MARK: - Configure
    func configure(with memo: Memo) {
        titleLabel.text = memo.title
        memoLabel.text = memo.content
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy. MM. dd HH:mm"
        dateLabel.text = dateFormatter.string(from: memo.date)
        
        if let imageData = memo.imageData, let image = UIImage(data: imageData) {
            thumbnailImageView.image = image
            thumbnailImageView.isHidden = false
        } else {
            thumbnailImageView.isHidden = true
            
            // Adjust constraints if no image
            titleLabel.snp.remakeConstraints {
                $0.top.equalToSuperview().offset(12)
                $0.leading.equalToSuperview().offset(12)
                $0.trailing.equalToSuperview().offset(-12)
            }
            
            memoLabel.snp.remakeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(4)
                $0.leading.equalToSuperview().offset(12)
                $0.trailing.equalToSuperview().offset(-12)
            }
        }
    }
    //MARK: - 재사용 준비

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        memoLabel.text = nil
        dateLabel.text = nil
        thumbnailImageView.image = nil
    }
}
