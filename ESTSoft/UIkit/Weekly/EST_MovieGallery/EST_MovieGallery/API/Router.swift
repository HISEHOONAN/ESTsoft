//
//  Router.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 2/28/25.
//

import UIKit
import Moya

var BaseURL : String = "http://kobis.or.kr/kobisopenapi/webservice/rest"

var APIKEY : String = Bundle.main.MovieKey

enum Router{
    case getDailyMovie(targetDt : String)
    case getWeeklyMovie(targetDt : String)
    case getMovieList(curPage : Int)
    case getDetailMovie(movieCd : String)
}

extension Router: TargetType {
    
    var baseURL: URL {
        URL(string : BaseURL)!
    }
    
    var path: String {
        switch self{
        case .getDailyMovie: return "/boxoffice/searchDailyBoxOfficeList.json"
        case .getWeeklyMovie: return "/boxoffice/searchWeeklyBoxOfficeList.json"
        case .getMovieList: return "/boxoffice/searchMovieList.json"
        case .getDetailMovie: return "/movie/searchMovieInfo.json"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getDailyMovie(let targetDate):
            return .requestParameters(parameters: [
                "key": APIKEY,
                "targetDt": targetDate
            ], encoding: URLEncoding.default)
            
        case .getWeeklyMovie(let targetDate):
            return .requestParameters(parameters: [
                "key": APIKEY,
                "targetDt": targetDate
            ], encoding: URLEncoding.default)
            
        case .getMovieList(let page):
            return .requestParameters(parameters: [
                "key": APIKEY,
                "curPage": page
            ], encoding: URLEncoding.default)
            
        case .getDetailMovie(let movieCd):
            return .requestParameters(parameters: [
                "key": APIKEY,
                "movieCd": movieCd
            ], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
