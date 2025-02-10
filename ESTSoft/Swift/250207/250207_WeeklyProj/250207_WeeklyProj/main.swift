//
//  main.swift
//  250207_WeeklyProj
//
//  Created by 안세훈 on 2/7/25.
//

import Foundation

let manager = ReflectionManager()

var loop = true

while loop {
    
    let menu = input().getMenuInput()
    
    switch menu {
    case 1: // 회고 추가
        let date = input().getDateInput()
        let content = input().getContentInput()
        manager.addReflection(date: date, content: content)
        
    case 2: // 회고 조회
        let date = input().getDateInput() // input()은 Optional이 아님
          // reflection은 Optional
        manager.getReflection(date: date)
       
        
    case 3: // 회고 수정
        let date = input().getDateInput()
        let newContent = input().getContentInput()
        manager.updateReflection(date: date, newContent: newContent)
        
    case 4: // 회고 삭제
        let date = input().getDateInput()
        manager.deleteReflection(date: date)
        
    case 5: // 전체 회고 목록 출력
        manager.listAllReflections()
        
    case 6: // 종료
        output().Success("프로그램을 종료합니다.")
        loop = false
    default:
        output().Error("잘못된 메뉴 선택입니다.")
    }
}

