//
//  memoViewModel.swift
//  EST_PersonalMemo
//
//  Created by 안세훈 on 3/8/25.
//

import Foundation
import Combine

class MemoViewModel {
    // MARK: - Properties
    private let memoKey = "SavedMemos"
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Published properties for Combine
    @Published var memos: [Memo] = []
    @Published var searchText: String = ""
    @Published var selectedDate: Date = Date()
    @Published var filteredMemos: [Memo] = []
    
    // MARK: - Initialization
    init() {
        loadMemos()
        setupBindings()
    }
    
    // MARK: - Setup Combine bindings
    private func setupBindings() {
        // Combine publishers to filter memos based on search text and selected date
        Publishers.CombineLatest3($memos, $searchText, $selectedDate)
            .map { memos, searchText, selectedDate -> [Memo] in
                let calendar = Calendar.current
                return memos.filter { memo in
                    let sameDay = calendar.isDate(memo.date, inSameDayAs: selectedDate)
                    
                    if searchText.isEmpty {
                        return sameDay
                    } else {
                        let titleContainsSearch = memo.title.lowercased().contains(searchText.lowercased())
                        let contentContainsSearch = memo.content.lowercased().contains(searchText.lowercased())
                        return sameDay && (titleContainsSearch || contentContainsSearch)
                    }
                }
            }
            .sink { [weak self] filteredMemos in
                self?.filteredMemos = filteredMemos
            }
            .store(in: &cancellables)
    }
    
    // MARK: - CRUD Operations
    func addMemo(_ memo: Memo) {
        memos.append(memo)
        saveMemos()
    }
    
    func updateMemo(_ memo: Memo) {
        if let index = memos.firstIndex(where: { $0.id == memo.id }) {
            memos[index] = memo
            saveMemos()
        }
    }
    
    func deleteMemo(at index: Int) {
        if index < filteredMemos.count {
            let memoToDelete = filteredMemos[index]
            memos.removeAll(where: { $0.id == memoToDelete.id })
            saveMemos()
        }
    }
    
    // MARK: - UserDefaults Storage
    private func saveMemos() {
        if let encodedData = try? JSONEncoder().encode(memos) {
            UserDefaults.standard.set(encodedData, forKey: memoKey)
        }
    }
    
    private func loadMemos() {
        if let savedData = UserDefaults.standard.data(forKey: memoKey),
           let decodedMemos = try? JSONDecoder().decode([Memo].self, from: savedData) {
            memos = decodedMemos
        }
    }
}
