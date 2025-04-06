//
//  HomeViewController.swift
//  EST_FirebaseRegister
//
//  Created by 안세훈 on 4/6/25.
//


import UIKit
import SnapKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    // MARK: - UI Components
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "환영합니다!"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그아웃", for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        return button
    }()
    
    // MARK: - ViewModel
    private let viewModel = HomeViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupUserInfo()
    }
    
    // MARK: - Setup UI
    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        title = "홈"
        
        setupHierarchy()
        setupLayout()
        setupActions()
    }
    
    private func setupHierarchy() {
        view.addSubviews(welcomeLabel, emailLabel, logoutButton)
    }
    
    private func setupLayout() {
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.centerX.equalToSuperview()
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(80)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    private func setupActions() {
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
    
    private func setupUserInfo() {
        if let currentUser = Auth.auth().currentUser {
            emailLabel.text = "로그인된 이메일: \(currentUser.email ?? "알 수 없음")"
        }
    }
    
    // MARK: - Actions
    @objc private func logoutButtonTapped() {
        viewModel.logout { [weak self] success in
            if success {
                self?.navigateToLogin()
            } else {
                self?.showAlert(message: "로그아웃에 실패했습니다.")
            }
        }
    }
    
    // MARK: - Navigation
    private func navigateToLogin() {
        let loginVC = LoginViewController()
        let navigationController = UINavigationController(rootViewController: loginVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
    
    // MARK: - Helpers
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
