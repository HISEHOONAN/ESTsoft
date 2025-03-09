//
//  Model.swift
//  EST_PersonalMemo
//
//  Created by 안세훈 on 3/7/25.
//

import Foundation

struct Memo: Codable {
    var id: UUID
    var title: String
    var content: String
    var date: Date
    var imageData: Data?
    
    init(id: UUID = UUID(), title: String, content: String, date: Date = Date(), imageData: Data? = nil) {
        self.id = id
        self.title = title
        self.content = content
        self.date = date
        self.imageData = imageData
    }
}
