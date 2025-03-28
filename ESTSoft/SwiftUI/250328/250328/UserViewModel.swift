//
//  UserViewModel.swift
//  250328
//
//  Created by 안세훈 on 3/28/25.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published private(set) var users: [UserData] = []

    func addUser(name: String) {
        let newUser = UserData(username: name)
        users.append(newUser)
    }

    // 삭제 기능 추가
    func deleteUser(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
}

