//
//  MemoDetailViewController.swift
//  EST_PersonalMemo
//
//  Created by 안세훈 on 3/9/25.
//

import UIKit
import Combine
import PhotosUI

class MemoDetailViewController: UIViewController {
    
    // MARK: - Properties
    private var viewModel: MemoViewModel
    private var existingMemo: Memo?
    private var cancellables = Set<AnyCancellable>()
    private var selectedImage: UIImage?
    
    // MARK: - UI Components
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "제목을 입력하세요"
        textField.font = DesignSystemFont.Pretendard_Bold20.value
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private let contentTextView: UITextView = {
        let textView = UITextView()
        textView.font = DesignSystemFont.Pretendard_Medium14.value
        textView.layer.cornerRadius = 10
        textView.backgroundColor = .white
        return textView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = DesignSystemFont.Pretendard_Medium12.value
        label.textColor = .gray
        return label
    }()
    
    private let imageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray6
        imageView.isHidden = true
        return imageView
    }()
    
    private let addImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "photo"), for: .normal)
        button.tintColor = .systemBlue
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("저장", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let removeImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .black.withAlphaComponent(0.5)
        button.layer.cornerRadius = 15
        button.isHidden = true
        return button
    }()
    
    // MARK: - Initialization
    init(viewModel: MemoViewModel, existingMemo: Memo? = nil) {
        self.viewModel = viewModel
        self.existingMemo = existingMemo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupUI()
        setupActions()
        updateDateLabel()
        loadExistingMemo()
    }
    
    // MARK: - Setup
    private func setupUI() {
        view.addSubviews(titleTextField, dateLabel, imageContainerView, contentTextView, saveButton)
        imageContainerView.addSubviews(addImageButton, imageView, removeImageButton)
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        imageContainerView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(200)
        }
        
        addImageButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        removeImageButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.width.height.equalTo(30)
        }
        
        contentTextView.snp.makeConstraints {
            $0.top.equalTo(imageContainerView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(saveButton.snp.top).offset(-20)
        }
        
        saveButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(50)
        }
    }
    
    private func setupActions() {
        saveButton.addTarget(self, action: #selector(saveMemo), for: .touchUpInside)
        addImageButton.addTarget(self, action: #selector(addImageTapped), for: .touchUpInside)
        removeImageButton.addTarget(self, action: #selector(removeImageTapped), for: .touchUpInside)
    }
    
    private func updateDateLabel() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy. MM. dd HH:mm"
        dateLabel.text = dateFormatter.string(from: Date())
    }
    
    private func loadExistingMemo() {
        guard let memo = existingMemo else { return }
        
        titleTextField.text = memo.title
        contentTextView.text = memo.content
        
        if let imageData = memo.imageData, let image = UIImage(data: imageData) {
            selectedImage = image
            imageView.image = image
            imageView.isHidden = false
            addImageButton.isHidden = true
            removeImageButton.isHidden = false
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy. MM. dd HH:mm"
        dateLabel.text = dateFormatter.string(from: memo.date)
    }
    
    // MARK: - Actions
    @objc private func saveMemo() {
        guard let title = titleTextField.text, !title.isEmpty else {
            showAlert(message: "제목을 입력해주세요")
            return
        }
        
        let content = contentTextView.text ?? ""
        var imageData: Data? = nil
        
        if let image = selectedImage {
            imageData = image.jpegData(compressionQuality: 0.7)
        }
        
        if let existingMemo = existingMemo {
            // Update existing memo
            let updatedMemo = Memo(
                id: existingMemo.id,
                title: title,
                content: content,
                date: existingMemo.date,
                imageData: imageData
            )
            viewModel.updateMemo(updatedMemo)
        } else {
            // Create new memo
            let newMemo = Memo(
                title: title,
                content: content,
                date: Date(),
                imageData: imageData
            )
            viewModel.addMemo(newMemo)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func addImageTapped() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .images
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc private func removeImageTapped() {
        selectedImage = nil
        imageView.image = nil
        imageView.isHidden = true
        addImageButton.isHidden = false
        removeImageButton.isHidden = true
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - PHPickerViewControllerDelegate
extension MemoDetailViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        guard let provider = results.first?.itemProvider, provider.canLoadObject(ofClass: UIImage.self) else { return }
        
        provider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
            guard let self = self, let selectedImage = image as? UIImage else { return }
            
            DispatchQueue.main.async {
                self.selectedImage = selectedImage
                self.imageView.image = selectedImage
                self.imageView.isHidden = false
                self.addImageButton.isHidden = true
                self.removeImageButton.isHidden = false
            }
        }
    }
}
