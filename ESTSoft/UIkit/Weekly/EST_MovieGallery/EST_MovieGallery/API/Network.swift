//
//  Network.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 2/28/25.
//

import CombineMoya
import Combine
import Moya

class Network {
    
    static let shared = Network()
    
    private let provider = MoyaProvider<Router>()
    
    //MARK: - 데일리
    func getDailyMovie(targetDt : String) -> AnyPublisher<DailyModelResponse, Error> {
        return provider.requestPublisher(.getDailyMovie(targetDt: targetDt))
            .tryMap { response in
                try response.map(DailyModelResponse.self)
            }
            .eraseToAnyPublisher()
    }
    
    //MARK: - 위클리
    func getWeeklyMovie(targetDt : String) -> AnyPublisher<WeeklyModelResponse, Error> {
        return provider.requestPublisher(.getWeeklyMovie(targetDt: targetDt))
            .tryMap{ response in
                try response.map(WeeklyModelResponse.self)
            }
            .eraseToAnyPublisher()
    }
    
    //MARK: - 영화 상세 정보
    func getDetailMovie(movieCd : String) -> AnyPublisher<DetailMovieResponse, Error> {
        return provider.requestPublisher(.getDetailMovie(movieCd: movieCd))
            .tryMap { response in
                try response.map(DetailMovieResponse.self)
            }
            .eraseToAnyPublisher()
    }
}
