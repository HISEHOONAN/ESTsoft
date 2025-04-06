//
//  HomeViewModel.swift
//  EST_FirebaseRegister
//
//  Created by 안세훈 on 4/6/25.
//

import Foundation
import FirebaseAuth

class HomeViewModel {
    
    var currentUserEmail: String? {
        return Auth.auth().currentUser?.email
    }
    
    func logout(completion: @escaping (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch {
            print("로그아웃 에러: \(error.localizedDescription)")
            completion(false)
        }
    }
}
