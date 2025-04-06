//
//  RegisterViewController.swift
//  EST_FirebaseRegister
//
//  Created by 안세훈 on 4/6/25.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    
    // MARK: - UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "회원가입"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일을 입력하세요"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력하세요 (6자 이상)"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.returnKeyType = .next
        return textField
    }()
    
    private let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 확인하세요"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
        return textField
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("회원가입", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        return button
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("이미 계정이 있으신가요? 로그인하기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        return button
    }()
    
    // MARK: - ViewModel
    private let viewModel = RegisterViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupBindings()
    }
    
    // MARK: - Setup UI
    private func configureUI() {
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        setupActions()
    }
    
    private func setupHierarchy() {
        view.addSubviews(titleLabel, emailTextField, passwordTextField, confirmPasswordTextField, registerButton, backButton)
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.left.right.height.equalTo(emailTextField)
        }
        
        confirmPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.left.right.height.equalTo(passwordTextField)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    
    private func setupActions() {
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Add tap gesture to dismiss keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupBindings() {
        // Bind view model signals/observables here when implementing reactive patterns
        // Example: viewModel.registerSuccess.bind { [weak self] _ in self?.navigateToLogin() }
    }
    
    // MARK: - Actions
    @objc private func registerButtonTapped() {
        guard let email = emailTextField.text, !email.isEmpty else {
            showAlert(message: "이메일을 입력해주세요.")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "비밀번호를 입력해주세요.")
            return
        }
        
        guard let confirmPassword = confirmPasswordTextField.text, confirmPassword == password else {
            showAlert(message: "비밀번호가 일치하지 않습니다.")
            return
        }
        
        if password.count < 6 {
            showAlert(message: "비밀번호는 6자 이상이어야 합니다.")
            return
        }
        
        // Show loading indicator
        let loadingAlert = showLoadingAlert()
        
        viewModel.register(email: email, password: password) { [weak self] success, error in
            // Dismiss loading indicator
            loadingAlert.dismiss(animated: true) {
                if success {
                    self?.showAlert(message: "회원가입에 성공했습니다!", completion: {
                        self?.navigationController?.popViewController(animated: true)
                    })
                } else {
                    self?.showAlert(message: error ?? "회원가입에 실패했습니다.")
                }
            }
        }
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Helpers
    private func showAlert(message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default) { _ in
            completion?()
        })
        present(alert, animated: true)
    }
    
    private func showLoadingAlert() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "처리 중...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating()
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true)
        
        return alert
    }
}

// MARK: - UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            confirmPasswordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            registerButtonTapped()
        }
        return true
    }
}
