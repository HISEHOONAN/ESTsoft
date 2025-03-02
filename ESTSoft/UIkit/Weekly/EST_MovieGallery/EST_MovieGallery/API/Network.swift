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
    
    func getDailyMovie() -> AnyPublisher<DailyModelResponse, Error> { //값을 모델 혹은 에러로 리턴
        return provider.requestPublisher(.getDailyMovie(targetDt: "20250302")) //네트워킹 요청
            .tryMap { response in
                try response.map(DailyModelResponse.self)
            }
            .eraseToAnyPublisher() //반환타입을 Publisher로 바꿈
    }
    
}

