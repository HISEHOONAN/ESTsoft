//
//  LoginViewModel.swift
//  EST_FirebaseRegister
//
//  Created by 안세훈 on 4/6/25.
//


import Foundation
import FirebaseAuth

class LoginViewModel {
    // You could add reactive properties here if using RxSwift/Combine
    
    func login(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(false, error.localizedDescription)
                return
            }
            
            guard authResult?.user != nil else {
                completion(false, "로그인에 실패했습니다.")
                return
            }
            
            completion(true, nil)
        }
    }
}
