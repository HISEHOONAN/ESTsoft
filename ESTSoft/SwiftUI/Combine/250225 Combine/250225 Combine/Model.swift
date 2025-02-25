//
//  Model.swift
//  250225 Combine
//
//  Created by 안세훈 on 2/24/25.
//
import Foundation

struct Model : Identifiable {
    let id = UUID()
    var number : Int
    var lapTime : TimeInterval
    var totalTime : TimeInterval
    
}
