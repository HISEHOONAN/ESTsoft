//
//  DetailViewController.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 3/3/25.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    private let viewModel = ViewModel.shared
    
    // MARK: - UI Components
    private let detailScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let englishTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private let infoContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.0)
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let directorTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.text = "감독"
        label.textColor = .darkGray
        return label
    }()
    
    private let directorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let actorsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.text = "출연"
        label.textColor = .darkGray
        return label
    }()
    
    private let actorsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let genreTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.text = "장르"
        label.textColor = .darkGray
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    private let releaseDateTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.text = "개봉일"
        label.textColor = .darkGray
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    private let runtimeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.text = "상영시간"
        label.textColor = .darkGray
        return label
    }()
    
    private let runtimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    private let productionYearTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.text = "제작년도"
        label.textColor = .darkGray
        return label
    }()
    
    private let productionYearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    private let nationTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.text = "제작국가"
        label.textColor = .darkGray
        return label
    }()
    
    private let nationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    private let ratingTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.text = "등급"
        label.textColor = .darkGray
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    private let dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        return view
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white.withAlphaComponent(0.8)
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        setupUI()
        configureData()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        // UIView extension으로 addSubviews 구현
        view.addSubviews(detailScrollView, backButton)
        detailScrollView.addSubview(contentView)
        
        contentView.addSubviews(
            titleLabel,
            englishTitleLabel,
            infoContainer,
            dividerLine
        )
        
        infoContainer.addSubviews(
            directorTitleLabel, directorLabel,
            actorsTitleLabel, actorsLabel,
            genreTitleLabel, genreLabel,
            releaseDateTitleLabel, releaseDateLabel,
            runtimeTitleLabel, runtimeLabel,
            productionYearTitleLabel, productionYearLabel,
            nationTitleLabel, nationLabel,
            ratingTitleLabel, ratingLabel
        )
        
        setupConstraints()
        setupActions()
    }
    
    private func setupConstraints() {
        detailScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalTo(detailScrollView)
            make.left.right.equalTo(view)
            make.width.equalTo(view)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(100)
            make.left.equalTo(contentView).offset(20)
            make.right.equalTo(contentView).offset(-20)
        }
        
        englishTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(contentView).offset(20)
            make.right.equalTo(contentView).offset(-20)
        }
        
        dividerLine.snp.makeConstraints { make in
            make.top.equalTo(englishTitleLabel.snp.bottom).offset(20)
            make.left.equalTo(contentView).offset(20)
            make.right.equalTo(contentView).offset(-20)
            make.height.equalTo(1)
        }
        
        infoContainer.snp.makeConstraints { make in
            make.top.equalTo(dividerLine.snp.bottom).offset(20)
            make.left.equalTo(contentView).offset(20)
            make.right.equalTo(contentView).offset(-20)
            make.bottom.equalTo(contentView).offset(-30)
        }
        
        // 감독 정보
        directorTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(infoContainer).offset(20)
            make.left.equalTo(infoContainer).offset(16)
            make.width.equalTo(80)
        }
        
        directorLabel.snp.makeConstraints { make in
            make.top.equalTo(directorTitleLabel)
            make.left.equalTo(directorTitleLabel.snp.right).offset(10)
            make.right.equalTo(infoContainer).offset(-16)
        }
        
        // 배우 정보
        actorsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(directorLabel.snp.bottom).offset(24)
            make.left.equalTo(infoContainer).offset(16)
            make.width.equalTo(80)
        }
        
        actorsLabel.snp.makeConstraints { make in
            make.top.equalTo(actorsTitleLabel)
            make.left.equalTo(actorsTitleLabel.snp.right).offset(10)
            make.right.equalTo(infoContainer).offset(-16)
        }
        
        // 장르 정보
        genreTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(actorsLabel.snp.bottom).offset(24)
            make.left.equalTo(infoContainer).offset(16)
            make.width.equalTo(80)
        }
        
        genreLabel.snp.makeConstraints { make in
            make.top.equalTo(genreTitleLabel)
            make.left.equalTo(genreTitleLabel.snp.right).offset(10)
            make.right.equalTo(infoContainer).offset(-16)
        }
        
        // 개봉일 정보
        releaseDateTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(genreLabel.snp.bottom).offset(24)
            make.left.equalTo(infoContainer).offset(16)
            make.width.equalTo(80)
        }
        
        releaseDateLabel.snp.makeConstraints { make in
            make.top.equalTo(releaseDateTitleLabel)
            make.left.equalTo(releaseDateTitleLabel.snp.right).offset(10)
            make.right.equalTo(infoContainer).offset(-16)
        }
        
        // 상영시간 정보
        runtimeTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(releaseDateLabel.snp.bottom).offset(24)
            make.left.equalTo(infoContainer).offset(16)
            make.width.equalTo(80)
        }
        
        runtimeLabel.snp.makeConstraints { make in
            make.top.equalTo(runtimeTitleLabel)
            make.left.equalTo(runtimeTitleLabel.snp.right).offset(10)
            make.right.equalTo(infoContainer).offset(-16)
        }
        
        // 제작년도 정보
        productionYearTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(runtimeLabel.snp.bottom).offset(24)
            make.left.equalTo(infoContainer).offset(16)
            make.width.equalTo(80)
        }
        
        productionYearLabel.snp.makeConstraints { make in
            make.top.equalTo(productionYearTitleLabel)
            make.left.equalTo(productionYearTitleLabel.snp.right).offset(10)
            make.right.equalTo(infoContainer).offset(-16)
        }
        
        // 국가 정보
        nationTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(productionYearLabel.snp.bottom).offset(24)
            make.left.equalTo(infoContainer).offset(16)
            make.width.equalTo(80)
        }
        
        nationLabel.snp.makeConstraints { make in
            make.top.equalTo(nationTitleLabel)
            make.left.equalTo(nationTitleLabel.snp.right).offset(10)
            make.right.equalTo(infoContainer).offset(-16)
        }
        
        // 등급 정보
        ratingTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(nationLabel.snp.bottom).offset(24)
            make.left.equalTo(infoContainer).offset(16)
            make.width.equalTo(80)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(ratingTitleLabel)
            make.left.equalTo(ratingTitleLabel.snp.right).offset(10)
            make.right.equalTo(infoContainer).offset(-16)
            make.bottom.equalTo(infoContainer).offset(-20)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.left.equalTo(view).offset(20)
            make.width.height.equalTo(40)
        }
    }
    
    private func setupActions() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Data Configuration
    private func configureData() {
        // MovieInfo 구조체에 맞게 수정된 데이터 설정
        guard let movieDetail = viewModel.DetailMovielist else {
            titleLabel.text = "영화 정보를 불러올 수 없습니다."
            return
        }
        
        // 영화 데이터에 따라 UI 업데이트
        titleLabel.text = movieDetail.movieNm
        englishTitleLabel.text = movieDetail.movieNmEn
        
        // 감독 정보 처리
        let directorNames = movieDetail.directors.map { $0.peopleNm }.joined(separator: ", ")
        directorLabel.text = directorNames
        
        // 배우 정보 처리 (최대 5명만 표시)
        let actorNames = movieDetail.actors.prefix(5).map { $0.peopleNm }.joined(separator: ", ")
        actorsLabel.text = actorNames
        
        // 개봉일 처리
        releaseDateLabel.text = formattedDate(from: movieDetail.openDt)
        
        // 상영시간 처리
        runtimeLabel.text = "\(movieDetail.showTm)분"
        
        // 장르 처리
        let genreNames = movieDetail.genres.map { $0.genreNm }.joined(separator: ", ")
        genreLabel.text = genreNames
        
        // 제작년도 처리
        productionYearLabel.text = movieDetail.prdtYear
        
        // 국가 처리
        let nationNames = movieDetail.nations.map { $0.nationNm }.joined(separator: ", ")
        nationLabel.text = nationNames
        
        // 심의 등급 처리
        let auditRating = movieDetail.audits.first?.watchGradeNm ?? "정보 없음"
        ratingLabel.text = auditRating
    }
    
    private func formattedDate(from dateString: String) -> String {
        // KOBIS API의 날짜 형식(YYYYMMDD)에 따라 포맷팅
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "yyyy년 MM월 dd일"
            return formatter.string(from: date)
        }
        
        return dateString
    }
}

#Preview {
    DetailViewController()
}
