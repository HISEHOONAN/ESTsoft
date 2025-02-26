//
//  Network.swift
//  250304 Combine
//
//  Created by 안세훈 on 2/26/25.
//

import Foundation
import CombineMoya
import Moya
import Combine
import SwiftUI

class Network {
    
    private let provider = MoyaProvider<Router>()
    //Moya Network는 제네릭 타입으로 TargetType 프로토콜을 준수하는 Enum 을 받고 있습니다.
    
    private var subscription = Set<AnyCancellable>()
    
    static let shared = Network()
    
    func fetchAdvice() -> AnyPublisher<AuthorResponse, Error> {
        return provider.requestPublisher(.getAdvice)
            .tryMap { response in
                try response.map(AuthorResponse.self)
            }
            .eraseToAnyPublisher()
    }
    
    //        func advice(){
    //            provider.requestPublisher(.getAdvice)
    //                .sink{ result in
    //                    switch result {
    //                    case let .failure(error):
    //                        print(error)
    //                    case .finished:
    //                        print("finished")
    //                    }
    //
    //                } receiveValue: { receivedValue in
    //                    guard let responseData = try? receivedValue.map(AuthorResponse.self) else {return}
    //                    print(responseData)
    //    //                self.viewModel.author = responseData.author
    //    //                self.viewModel.autorProfile = responseData.authorProfile
    //    //                self.viewModel.message = responseData.message
    //
    //                }.store(in: &subscription)
    //        }
}
