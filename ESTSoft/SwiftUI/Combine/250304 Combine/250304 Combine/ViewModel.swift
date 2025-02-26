//
//  ViewModel.swift
//  250304 Combine
//
//  Created by 안세훈 on 2/26/25.
//
import SwiftUI
import Combine

class ViewModel : ObservableObject {
    
    //MARK: - publisher
    @Published var author : String = ""
    @Published var authorProfile : String = ""
    @Published var message : String = ""
    
    private var Cancellable = Set<AnyCancellable>()
    
    init() {
        fetchAdvice()
    }
    
    func fetchAdvice() {
        Network.shared.fetchAdvice()
            .receive(on: DispatchQueue.main) // UI 업데이트는 메인 스레드에서 수행
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                case .finished:
                    print("Finished fetching advice")
                }
            }, receiveValue: { [weak self] response in
                
                self?.author = response.author
                self?.authorProfile = response.authorProfile
                self?.message = response.message
                
            })
            .store(in: &Cancellable)
    }
}
