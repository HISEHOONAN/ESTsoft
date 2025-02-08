//
//  ReflectionManager.swift
//  250207_WeeklyProj
//
//  Created by 안세훈 on 2/7/25.
//

class ReflectionManager {
    
    static let shared = ReflectionManager()
    
    var reflectionNumber : Int = 0
    var loop : Bool = true
    
    func intro(){
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
            print("번호",terminator: ": ")
            
            reflectionNumber = Int(readLine() ?? "0") ?? 0
            
            switch reflectionNumber{
            case 1: addReflection().addfunc()
            case 2: getReflection().getfunc()
            case 3: updateReflection().updatefunc()
            case 4: deleteReflection().deletefunc()
            case 5: listAllReflections().listfunc()
            case 6: print("프로그램을 종료합니다.")
                loop = false
            default:
                print("올바른 번호를 입력해주세요.")
            }
        }
    }
}
extension ReflectionManager {
    
    func addReflection(date: String, content: String) {
        if reflections[date] == nil {
            reflections[date] = Reflection(date: date, content: content)
            print("회고가 추가되었습니다.")
        } else {
            print("해당 날짜의 회고가 이미 존재합니다.")
        }
    }
    
    func getReflection(date: String) {
        if let reflection = reflections[date] {
            print("날짜: \(reflection.date)\n내용: \(reflection.content)")
        } else {
            print("해당 날짜의 회고가 존재하지 않습니다.")
        }
    }
    
    func updateReflection(date: String, newContent: String) {
        if reflections[date] != nil {
            reflections[date]?.content = newContent
            print("회고가 수정되었습니다.")
        } else {
            print("해당 날짜의 회고가 존재하지 않습니다.")
        }
    }
    
    func deleteReflection(date: String) {
        if reflections.removeValue(forKey: date) != nil {
            print("회고가 삭제되었습니다.")
        } else {
            print("해당 날짜의 회고가 존재하지 않습니다.")
        }
    }
    
    func listAllReflections() {
        if reflections.isEmpty {
            print("저장된 회고가 없습니다.")
        } else {
            reflections.values.forEach { print("날짜: \($0.date)\n내용: \($0.content)\n") }
        }
    }
}
//import Foundation
//
//// MARK: - Reflection 모델
//struct Reflection {
//    let date: String
//    var content: String
//}
//
//// MARK: - ReflectionManager (Singleton)
//class ReflectionManager {
//    static let shared = ReflectionManager()
//    private init() {}
//    
//    private var reflections: [String: Reflection] = [:]
//    
//    func addReflection(date: String, content: String) {
//        if reflections[date] == nil {
//            reflections[date] = Reflection(date: date, content: content)
//            print("회고가 추가되었습니다.")
//        } else {
//            print("해당 날짜의 회고가 이미 존재합니다.")
//        }
//    }
//    
//    func getReflection(date: String) {
//        if let reflection = reflections[date] {
//            print("날짜: \(reflection.date)\n내용: \(reflection.content)")
//        } else {
//            print("해당 날짜의 회고가 존재하지 않습니다.")
//        }
//    }
//    
//    func updateReflection(date: String, newContent: String) {
//        if reflections[date] != nil {
//            reflections[date]?.content = newContent
//            print("회고가 수정되었습니다.")
//        } else {
//            print("해당 날짜의 회고가 존재하지 않습니다.")
//        }
//    }
//    
//    func deleteReflection(date: String) {
//        if reflections.removeValue(forKey: date) != nil {
//            print("회고가 삭제되었습니다.")
//        } else {
//            print("해당 날짜의 회고가 존재하지 않습니다.")
//        }
//    }
//    
//    func listAllReflections() {
//        if reflections.isEmpty {
//            print("저장된 회고가 없습니다.")
//        } else {
//            reflections.values.forEach { print("날짜: \($0.date)\n내용: \($0.content)\n") }
//        }
//    }
//}
//
//// MARK: - CommonFunction (공통 기능)
//class CommonFunction {
//    func inputDate() -> String? {
//        print("날짜를 입력해주세요. (YYYY-MM-DD): ", terminator: "")
//        return readLine()
//    }
//    
//    func inputContent() -> String? {
//        print("내용을 입력해주세요: ", terminator: "")
//        return readLine()
//    }
//}
//
//let commonFunction = CommonFunction()
//
//// MARK: - Reflection 기능별 클래스
//class ReflectionAdder {
//    func execute() {
//        print("::: 회고 추가 :::")
//        guard let date = commonFunction.inputDate(), let content = commonFunction.inputContent() else { return }
//        ReflectionManager.shared.addReflection(date: date, content: content)
//    }
//}
//
//class ReflectionViewer {
//    func execute() {
//        print("::: 회고 조회 :::")
//        guard let date = commonFunction.inputDate() else { return }
//        ReflectionManager.shared.getReflection(date: date)
//    }
//}
//
//class ReflectionUpdater {
//    func execute() {
//        print("::: 회고 수정 :::")
//        guard let date = commonFunction.inputDate(), let newContent = commonFunction.inputContent() else { return }
//        ReflectionManager.shared.updateReflection(date: date, newContent: newContent)
//    }
//}
//
//class ReflectionDeleter {
//    func execute() {
//        print("::: 회고 삭제 :::")
//        guard let date = commonFunction.inputDate() else { return }
//        ReflectionManager.shared.deleteReflection(date: date)
//    }
//}
//
//class ReflectionLister {
//    func execute() {
//        print("::: 전체 회고 조회 :::")
//        ReflectionManager.shared.listAllReflections()
//    }
//}
//
//// MARK: - 메인 실행 루프
//var loop: Bool = true
//
//while loop {
//    print("""
//    ::: 회고 시스템 :::
//        1. 회고 추가
//        2. 회고 조회
//        3. 회고 수정
//        4. 회고 삭제
//        5. 전체 회고 목록
//        6. 프로그램 종료
//    """)
//    print("번호: ", terminator: "")
//    
//    guard let input = readLine(), let reflectionNumber = Int(input) else {
//        print("올바른 번호를 입력해주세요.")
//        continue
//    }
//    
//    switch reflectionNumber {
//    case 1: ReflectionAdder().execute()
//    case 2: ReflectionViewer().execute()
//    case 3: ReflectionUpdater().execute()
//    case 4: ReflectionDeleter().execute()
//    case 5: ReflectionLister().execute()
//    case 6:
//        print("프로그램을 종료합니다.")
//        loop = false
//    default:
//        print("올바른 번호를 입력해주세요.")
//    }
//}
