//
//  ViewModel.swift
//  250218 Combine
//
//  Created by 안세훈 on 2/18/25.
//

import Foundation
import Combine

class ViewModel : ObservableObject {
    
    //@Published를 통해 바로바로 변화를 감지할 수 있음.
    //앱이 종료되면 메모리에서 제거댐ㅇㅇ
    
    
    //입력필드
    @Published var email = ""
    @Published var password = ""
    @Published var passwordConfirmation = ""
    
    //유효성 검사
    @Published var isEmailValid = false
    @Published var isPasswordValid = false
    @Published var isPasswordMatch = false
    @Published var canSubmit = false
    
    
    
    //구독을 위한 set
    private var cancellables = Set<AnyCancellable>()
    
    
    init(){
        //이메일 유효성 검사
        $email // Publisher<String, Never> 타입의 스트림 시작 -> 문자열이냐? or ""이냐
            .map{ email in // 들어오는 이메일 문자열을 변환
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate =  NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email) // Bool값으로 변환
        } .assign(to: \.isEmailValid, on: self) //결과를 isEmailValid에 할당.
            .store(in: &cancellables) //구독을 저장?
        
        //비밀번호 유효성 검사, 최소 8글자 이상
        $password  // Publisher<String, Never> 타입의 스트림 시작
            .map { $0.count >= 8 } // 문자열 길이가 8 이상인지 확인하여 Bool로 변환
            .assign(to: \.isPasswordValid, on: self)  // 결과를 isPasswordValid에 할당
            .store(in: &cancellables) // 구독을 저장
        
        // 비밀번호 일치
        Publishers.CombineLatest($password, $passwordConfirmation)
        // 두 개의 Publisher를 결합
        // (String, String) 튜플을 받아서 비교
            .map { password, passwordConfirmation in
                return !password.isEmpty && password == passwordConfirmation
            } //비어있지 않은 비밀번호, 비밀번호일치 string이 같을경우에만 isPasswordMatch에 true를 할당.
            .assign(to: \.isPasswordMatch, on: self) // 결과를 isPasswordMatch에 할당
            .store(in: &cancellables) // 구독을 저장
        
        // 회원가입의 가능여부 -> 모든 것들이 true가 아닐 경우 안댐ㅇㅇ
        Publishers.CombineLatest3($isEmailValid, $isPasswordValid, $isPasswordMatch)
                                // (Bool, Bool, Bool) 튜플을 받아서 모든 조건이 true인지 확인
            .map { isEmailValid, isPasswordValid, isPasswordMatch in
                return isEmailValid && isPasswordValid && isPasswordMatch
            }
            .assign(to: \.canSubmit, on: self) // 결과를 canSubmit에 할당
            .store(in: &cancellables) // 구독을 저장
    }
    
    func signUp() {
        // 실제 회원가입 로직 구현
        print("회원가입 처리: \(email)")
    }
    
    
}

