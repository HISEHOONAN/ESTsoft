//
//  input.swift
//  250207_WeeklyProj
//
//  Created by 안세훈 on 2/9/25.
//
import Foundation

class input{
    
     func getDateInput() -> String {
        print("날짜를 입력하세요 (예: 2023-10-01): ", terminator: "")
        return readLine() ?? ""
    }
    
     func getContentInput() -> String {
        print("회고 내용을 입력하세요: ", terminator: "")
        return readLine() ?? ""
    }
    
     func getMenuInput() -> Int {
        print("""
        ==========================
        1. 회고 추가
        2. 회고 조회
        3. 회고 수정
        4. 회고 삭제
        5. 전체 회고 목록 출력
        6. 종료
        ==========================
        메뉴를 선택하세요: 
        """, terminator: "")
        return Int(readLine() ?? "") ?? 0
    }
}
