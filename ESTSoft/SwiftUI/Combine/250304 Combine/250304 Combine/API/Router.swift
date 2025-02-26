//
//  Router.swift
//  250304 Combine
//
//  Created by 안세훈 on 2/26/25.
//

import Foundation
import Moya

let BaseURL : String = "https://korean-advice-open-api.vercel.app"

enum Router {
    case getAdvice
}

//MARK: - Moya basic Method
extension Router : TargetType {
    var baseURL: URL {
        URL(string: BaseURL)!
    }
    
    var path: String {
        switch self{
        case .getAdvice: return "/api/advice"
            
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .getAdvice: return .get
            
        }
    }
    
    var task: Moya.Task {
        switch self{
        case .getAdvice: return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self{
        case .getAdvice: return nil
        }
    }
    
    var validationType: ValidationType {
        .successCodes
    }
}
