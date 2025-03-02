//
//  Model.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 2/28/25.
//

import UIKit

// MARK: - Shared Types
enum RankOldAndNew: String, Codable {
    case new = "NEW"
    case old = "OLD"
}

// MARK: - 일별 박스오피스 요청
struct DailyModelRequest: Codable {
    let targetDt: String
}

// MARK: - 일별 박스오피스 응답
struct DailyModelResponse: Codable {
    let boxOfficeResult: DailyBoxOfficeResult
}


struct DailyBoxOfficeResult: Codable {
    let boxofficeType, showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}


struct DailyBoxOfficeList: Codable {
    let rnum, rank, rankInten: String
    let rankOldAndNew: RankOldAndNew
    let movieCD, movieNm, openDt, salesAmt: String
    let salesShare, salesInten, salesChange, salesAcc: String
    let audiCnt, audiInten, audiChange, audiAcc: String
    let scrnCnt, showCnt: String

    enum CodingKeys: String, CodingKey {
        case rnum, rank, rankInten, rankOldAndNew
        case movieCD = "movieCd"
        case movieNm, openDt, salesAmt, salesShare, salesInten, salesChange, salesAcc, audiCnt, audiInten, audiChange, audiAcc, scrnCnt, showCnt
    }
}

// MARK: - 주간 박스오피스 요청
struct WeeklyModelRequest: Codable {
    let targetDt: String
}

// MARK: - 주간 박스오피스 응답
struct WeeklyModelResponse: Codable {
    let boxOfficeResult: WeeklyBoxOfficeResult
}

struct WeeklyBoxOfficeResult: Codable {
    let boxofficeType, showRange, yearWeekTime: String
    let weeklyBoxOfficeList: [WeeklyBoxOfficeList]
}

struct WeeklyBoxOfficeList: Codable {
    let rnum, rank, rankInten: String
    let rankOldAndNew: RankOldAndNew
    let movieCD, movieNm, openDt, salesAmt: String
    let salesShare, salesInten, salesChange, salesAcc: String
    let audiCnt, audiInten, audiChange, audiAcc: String
    let scrnCnt, showCnt: String

    enum CodingKeys: String, CodingKey {
        case rnum, rank, rankInten, rankOldAndNew
        case movieCD = "movieCd"
        case movieNm, openDt, salesAmt, salesShare, salesInten, salesChange, salesAcc, audiCnt, audiInten, audiChange, audiAcc, scrnCnt, showCnt
    }
}

// MARK: - 영화 상세보기 요청
struct DetailMovieRequest: Codable {
    let movieCd: String
}
//MARK: - 영화 상세보기 응답

struct DetailMovieResponse: Codable {
    let movieInfoResult: MovieInfoResult
}

struct MovieInfoResult: Codable {
    let movieInfo: MovieInfo
    let source: String
}

struct MovieInfo: Codable {
    let movieCD, movieNm, movieNmEn, movieNmOg: String
    let showTm, prdtYear, openDt, prdtStatNm: String
    let typeNm: String
    let nations: [Nation]
    let genres: [Genre]
    let directors: [Director]
    let actors: [Actor]
    let showTypes: [ShowType]
    let companys: [Company]
    let audits: [Audit]
    let staffs: [Staff]

    enum CodingKeys: String, CodingKey {
        case movieCD = "movieCd"
        case movieNm, movieNmEn, movieNmOg, showTm, prdtYear, openDt, prdtStatNm, typeNm, nations, genres, directors, actors, showTypes, companys, audits, staffs
    }
}

// MARK: - Actor
struct Actor: Codable {
    let peopleNm, peopleNmEn, cast, castEn: String
}

// MARK: - Audit
struct Audit: Codable {
    let auditNo, watchGradeNm: String
}

// MARK: - Company
struct Company: Codable {
    let companyCD, companyNm, companyNmEn, companyPartNm: String

    enum CodingKeys: String, CodingKey {
        case companyCD = "companyCd"
        case companyNm, companyNmEn, companyPartNm
    }
}

// MARK: - Director
struct Director: Codable {
    let peopleNm, peopleNmEn: String
}

// MARK: - Genre
struct Genre: Codable {
    let genreNm: String
}

// MARK: - Nation
struct Nation: Codable {
    let nationNm: String
}

// MARK: - ShowType
struct ShowType: Codable {
    let showTypeGroupNm, showTypeNm: String
}

// MARK: - Staff
struct Staff: Codable {
    let peopleNm, peopleNmEn, staffRoleNm: String
}
