//
//  ReflectionManager.swift
//  250207_WeeklyProj
//
//  Created by 안세훈 on 2/9/25.
//

import Foundation

class ReflectionManager {
    
    var ReflectionData: [String: Reflection] = [:]
    
    // 회고 추가 메서드
    func addReflection(date: String, content: String) {
        let reflection = Reflection(date: date, content: content)
        ReflectionData[date] = reflection
        print("회고가 추가되었습니다.")
    }
    
    // 회고 조회 메서드
    func getReflection(date: String) {
        if let reflection = ReflectionData[date] {
            print("날짜: \(reflection.date)")
            print("내용: \(reflection.content)")
        } else {
            print("해당 날짜의 회고가 없습니다.")
        }
    }
    
    // 회고 수정 메서드
    func updateReflection(date: String, newContent: String) {
        if let _ = ReflectionData[date] {
            ReflectionData[date]?.content = newContent
            print("회고가 수정되었습니다.")
        } else {
            print("해당 날짜의 회고가 없습니다.")
        }
    }
    
    // 회고 삭제 메서드
    func deleteReflection(date: String) {
        if let _ = ReflectionData.removeValue(forKey: date) {
            print("회고가 삭제되었습니다.")
        } else {
            print("해당 날짜의 회고가 없습니다.")
        }
    }
    
    // 전체 회고 목록 출력 메서드
    func listAllReflections() {
        if ReflectionData.isEmpty {
            print("저장된 회고가 없습니다.")
        } else {
            for (date, ReflectionData) in ReflectionData {
                print("날짜: \(date)")
                print("내용: \(ReflectionData.content)")
            }
        }
    }
    
}
