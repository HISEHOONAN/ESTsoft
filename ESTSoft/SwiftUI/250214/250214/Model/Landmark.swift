//
//  Landmark.swift
//  250214
//
//  Created by 안세훈 on 2/14/25.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark : Hashable, Codable,Identifiable {
    var id : Int
    var name : String
    var park : String
    var state : String
    var description : String
    var isFavorite : Bool
    
    
    //MARK: - 이미지 이름

    private var imageName : String
    var image: Image {
        Image(imageName)
    }
    
    //MARK: - 위도 경도

    private var coordinates : Coordinates
    //위도 경도를 사용할 프로퍼티
    
    var locationCoordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    
}
