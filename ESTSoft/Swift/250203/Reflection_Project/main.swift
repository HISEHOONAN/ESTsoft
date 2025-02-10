//
//  main.swift
//  Reflection_Project
//
//  Created by 안세훈 on 2/2/25.
//

import Foundation

//MARK: - properties
var reflectionNumber : Int = 0
var loop : Bool = true

//MARK: - 기능 별 분기처리
while loop{
    print("""
    ::: 회고시스템에 오신것을 환영합니다. :::
                1. 회고 추가
                2. 회고 조회
                3. 회고 수정
                4. 회고 삭제
                5. 전체 회고 목록
                6. 프로그램 종료
    """)
    print("번호 :",terminator: "")
    
    reflectionNumber = Int(readLine() ?? "0") ?? 0
    
    switch reflectionNumber{
    case 1: addReflection()
    case 2: getReflection()
    case 3: updateReflection()
    case 4: deleteReflection()
    case 5: listAllReflections()
    case 6: print("프로그램을 종료합니다.")
            loop = false
    default:
        print("올바른 번호를 입력해주세요.")
    }
}

//MARK: - 회고 기능들
func addReflection() {
    print("::: 회고 추가 :::")
    print("날짜를 입력해주세요. (2025-01-01): ", terminator: "")
    guard let date = readLine() else { return }
    print("내용을 입력해주세요: ", terminator: "")
    guard let content = readLine() else { return }
    ReflectionManager.shared.addReflection(date: date, content: content)
}

func getReflection() {
    print("::: 회고 조회 :::")
    print("날짜를 입력해주세요. (2025-01-01): ", terminator: "")
    guard let date = readLine() else { return }
    ReflectionManager.shared.getReflection(date: date)
}

func updateReflection() {
    print("::: 회고 수정 :::")
    print("날짜를 입력해주세요. (2025-01-01): ", terminator: "")
    guard let date = readLine() else { return }
    print("새로운 내용을 입력해주세요: ", terminator: "")
    guard let newContent = readLine() else { return }
    ReflectionManager.shared.updateReflection(date: date, newContent: newContent)
}

func deleteReflection() {
    print("::: 회고 삭제 :::")
    print("날짜를 입력해주세요. (2025-01-01): ", terminator: "")
    guard let date = readLine() else { return }
    ReflectionManager.shared.deleteReflection(date: date)
}

func listAllReflections() {
    print("::: 전체 회고 조회 :::")
    ReflectionManager.shared.listAllReflections()
}
