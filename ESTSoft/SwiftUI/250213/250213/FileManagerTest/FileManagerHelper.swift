//
//  FileManagerHelper.swift
//  250213
//
//  Created by 안세훈 on 2/13/25.
//

import SwiftUI

//데이터를 저장하고 불러오는 역할
//외부에서 데이터를 변경해야 하기 때문에 참조형으로 선언
class FileManagerHelper{
    
    //싱글톤 : 이 클래스에서 객체는 오직 하나뿐이다.
    //FileManagerHelper.shared.~~
    static let shared = FileManagerHelper()
    
    //저장할 파일 이름
    private let fileName = "user.json"
    
    //Json 파일로 저장하기.
    func saveUserData(_ users: [UserModel]){
        // Document 디렉토리의 경로를 가져옴 (앱 전용 사용자 데이터 저장 경로)
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentDirectory.appendingPathComponent(fileName)  // 파일 경로 생성
        
        let encoder = JSONEncoder()  // JSON 인코더 생성
        if let data = try? encoder.encode(users) {  // users 배열을 JSON 데이터로 변환
            do {
                try data.write(to: fileURL)  // 데이터를 파일에 저장
                print("데이터 저장 성공: \(fileURL)")  // 저장 성공 메시지 출력
            } catch {
                print("저장 실패: \(error)")  // 저장 실패 시 오류 메시지 출력
            }
        }
    }
    
    //Json 문자열을 배열로 불러오기.
    func loadUserData() -> [UserModel]{
        // Document 디렉토리의 경로와 저장된 파일의 경로 생성
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        if let data = try? Data(contentsOf: fileURL) {  // 파일에서 데이터를 읽어옴
            let decoder = JSONDecoder()  // JSON 디코더 생성
            if let users = try? decoder.decode([UserModel].self, from: data) {  // JSON 데이터를 User 배열로 변환
                print("데이터 불러오기 성공")
                return users  // 변환된 User 배열 반환
            }
        }
        print("데이터 불러오기 실패")
        return []  // 데이터 불러오기 실패 시 빈 배열 반환
    }
    
}
