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
    @Published var WeeklyMovieList : [WeeklyBoxOfficeList] = []
    
    @Published var DetailMovielist : MovieInfo? = nil
    
    @Published var selectedDate : String = ""
    @Published var movieCd : String = ""
    
    private var cancellables : Set<AnyCancellable> = []
    
    private init(){
        self.selectedDate = ViewModel.getDate()
        getDailyMovie(targetDt: selectedDate)
        getWeeklyMovie(targetDt: selectedDate)
    }
    
    //MARK: - 데일리
    func getDailyMovie(targetDt : String){
        Network.shared.getDailyMovie(targetDt : targetDt)
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
            })
            .store(in: &cancellables)
    }
    
    //MARK: - 위클리
    func getWeeklyMovie(targetDt : String){
        Network.shared.getWeeklyMovie(targetDt : targetDt)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion{
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("finished")
                }
            }, receiveValue: { response in
                self.WeeklyMovieList = response.boxOfficeResult.weeklyBoxOfficeList
            })
            .store(in: &cancellables)
    }
    
    //MARK: - 영화 상세정보
    func getDetailMovie(movieCd: String, completion: @escaping () -> Void) {
        Network.shared.getDetailMovie(movieCd: movieCd)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completionState in
                switch completionState {
                case .failure(let error):
                    print("\(error.localizedDescription)")
                case .finished:
                    completion() 
                }
            }, receiveValue: { response in
                self.DetailMovielist = response.movieInfoResult.movieInfo
            })
            .store(in: &cancellables)
    }
    
    
    
    
    //MARK: - 날짜 형식 변환
    static func getDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: Date())
    }
}
