//
//  MainViewController.swift
//  EST_PersonalMemo
//
//  Created by 안세훈 on 3/7/25.
//

import Combine
import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    private var viewModel = MemoViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "메모"
        label.font = DesignSystemFont.Pretendard_Bold30.value
        return label
    }()
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "  검색"
        textField.textColor = .black
        textField.layer.cornerRadius = 10
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private let datePickerButton: UIButton = {
        let button = UIButton()
        button.setTitle("날짜 선택", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return button
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .inline
        picker.backgroundColor = .white
        picker.layer.cornerRadius = 10
        picker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        return picker
    }()
    
    private lazy var memoTableView: UITableView = {
        let view = UITableView()
        view.layer.cornerRadius = 10
        view.separatorStyle = .none
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private let floatingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.setImage(UIImage(systemName: "plus"), for: .highlighted)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        return button
    }()
    
    private let emptyStateLabel: UILabel = {
        let label = UILabel()
        label.text = "메모가 없습니다.\n새 메모를 추가해보세요."
        label.font = DesignSystemFont.Pretendard_Medium16.value
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.navigationController?.navigationBar.isHidden = true
        setupUI()
        setupBindings()
        setupActions()
    }
    
    // MARK: - Setup
    private func setupUI() {
        tableSetup()
        searchTextField.delegate = self
        
        view.addSubviews(titleLabel, searchTextField, datePickerButton, memoTableView, floatingButton, emptyStateLabel, datePicker)
        datePicker.isHidden = true
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        searchTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.height.equalTo(40)
        }
        
        datePickerButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(searchTextField.snp.bottom).offset(10)
            $0.height.equalTo(40)
        }
        
        datePicker.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(datePickerButton.snp.bottom).offset(10)
        }
        
        memoTableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(datePickerButton.snp.bottom).offset(10)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        emptyStateLabel.snp.makeConstraints {
            $0.center.equalTo(memoTableView)
            $0.leading.trailing.equalToSuperview().inset(40)
        }
        
        floatingButton.snp.makeConstraints {
            $0.height.width.equalTo(50)
            $0.trailing.equalToSuperview().inset(40)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        // Update date button text
        updateDateButtonTitle()
    }
    
    private func tableSetup() {
        memoTableView.delegate = self
        memoTableView.dataSource = self
        memoTableView.register(MemoTableViewCell.self, forCellReuseIdentifier: "memoTableViewCell")
    }
    
    private func setupBindings() {
        // Bind search text field to view model
        searchTextField.textPublisher()
            .assign(to: \.searchText, on: viewModel)
            .store(in: &cancellables)
        
        // Bind filtered memos to tableview
        viewModel.$filteredMemos
            .receive(on: DispatchQueue.main)
            .sink { [weak self] memos in
                self?.memoTableView.reloadData()
                self?.emptyStateLabel.isHidden = !memos.isEmpty
            }
            .store(in: &cancellables)
    }
    
    private func setupActions() {
        floatingButton.addTarget(self, action: #selector(addMemoTapped), for: .touchUpInside)
        datePickerButton.addTarget(self, action: #selector(datePickerButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func addMemoTapped() {
        let detailVC = MakeMemoViewController(viewModel: viewModel)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc private func datePickerButtonTapped() {
        datePicker.isHidden.toggle()
        
        if datePicker.isHidden {
            memoTableView.snp.remakeConstraints {
                $0.leading.trailing.equalToSuperview().inset(20)
                $0.top.equalTo(datePickerButton.snp.bottom).offset(10)
                $0.bottom.equalTo(view.safeAreaLayoutGuide)
            }
        } else {
            memoTableView.snp.remakeConstraints {
                $0.leading.trailing.equalToSuperview().inset(20)
                $0.top.equalTo(datePicker.snp.bottom).offset(10)
                $0.bottom.equalTo(view.safeAreaLayoutGuide)
            }
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func dateSelected() {
        viewModel.selectedDate = datePicker.date
        updateDateButtonTitle()
        datePicker.isHidden = true
        
        memoTableView.snp.remakeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(datePickerButton.snp.bottom).offset(10)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func updateDateButtonTitle() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy. MM. dd"
        datePickerButton.setTitle(dateFormatter.string(from: viewModel.selectedDate), for: .normal)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredMemos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "memoTableViewCell", for: indexPath) as? MemoTableViewCell else {
            return UITableViewCell()
        }
        
        let memo = viewModel.filteredMemos[indexPath.row]
        cell.configure(with: memo)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memo = viewModel.filteredMemos[indexPath.row]
        let detailVC = MakeMemoViewController(viewModel: viewModel, existingMemo: memo)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "삭제") { [weak self] (_, _, completion) in
            self?.viewModel.deleteMemo(at: indexPath.row)
            completion(true)
        }
        deleteAction.backgroundColor = .systemRed
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

// MARK: - UITextFieldDelegate
extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - UITextField Publisher
extension UITextField {
    func textPublisher() -> AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { notification in
                (notification.object as? UITextField)?.text ?? ""
            }
            .eraseToAnyPublisher()
    }
}

#Preview {
    MainViewController()
}
