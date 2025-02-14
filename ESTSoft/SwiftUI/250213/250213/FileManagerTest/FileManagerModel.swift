//
//  FileManagerModel.swift
//  250213
//
//  Created by 안세훈 on 2/13/25.
//

import SwiftUI
//VO, DTO or Bean
struct UserModel : Codable {
    var UserId : UUID
    var UserName : String
    var UserAge : Int
}
