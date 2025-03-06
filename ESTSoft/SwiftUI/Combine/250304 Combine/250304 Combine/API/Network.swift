//
//  Network.swift
//  250304 Combine
//
//  Created by 안세훈 on 2/26/25.
//

import CombineMoya
import Moya
import Combine
import SwiftUI

class Network {
    private let provider = MoyaProvider<Router>()
    //Moya Network는 제네릭 타입으로 TargetType 프로토콜을 준수하는 Enum 을 받고 있습니다.
    
    static let shared = Network()
    
    //MARK: - Network
    func fetchAdvice() -> AnyPublisher<AuthorResponse, Error> { //값을 모델 혹은 에러로 리턴
        return provider.requestPublisher(.getAdvice) //네트워킹 요청
            .print("")
            .tryMap { response in
                try response.map(AuthorResponse.self)
            }
            .eraseToAnyPublisher() //반환타입을 Publisher로 바꿈
    }
}
