//
//  ViewModel.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 3/3/25.
//

import Combine
import UIKit

class ViewModel : ObservableObject {
    
    static let shared = ViewModel()
    
    @Published var DailyMovieList : [DailyBoxOfficeList] = []
    
    private var cancellables : Set<AnyCancellable> = []
    
    private init(){
        getDailyMovie()
    }
    
    func getDailyMovie(){
        Network.shared.getDailyMovie()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion{
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("finished")
                }
            }, receiveValue: { response in
                self.DailyMovieList = response.boxOfficeResult.dailyBoxOfficeList
                
                print(self.DailyMovieList)
            })
            .store(in: &cancellables) // 이 부분이 누락되었습니다
    }
}
