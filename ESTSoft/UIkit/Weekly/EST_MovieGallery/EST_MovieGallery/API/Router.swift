//
//  Router.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 2/28/25.
//

import Foundation
import Moya

var BaseURL : String = "http://kobis.or.kr/kobisopenapi/webservice/rest/"

enum Router{
    case getDailyMovie
    case getWeeklyMovie
    case getMovieList
    case getDetailMovie
}

//extension Router: TargetType {
//    
//    var baseURL: URL {
//        URL(string : BaseURL)!
//    }
//    
//    var path: String {
//        <#code#>
//    }
//    
//    var method: Moya.Method {
//        <#code#>
//    }
//    
//    var task: Moya.Task {
//        <#code#>
//    }
//    
//    var headers: [String : String]? {
//        <#code#>
//    }
//    
//    
//}
