//
//  View.swift
//  250206
//
//  Created by 안세훈 on 2/6/25.
//

import Foundation

class ShapeView {
    // Array 선언
    // 빈 배열 생성
    // let shapeList = [Shape]()
    // 선과 동시에 초기화
    // let shapeList = [Circle(), Rectangle(), Circle(), Circle()]
    // 빈 배열에 데이터 추가: append() 사용.
    // let으로 선언하면 배열을 변경하거나 요소를 바꿀수 없다.
    
    var shapeList: [Shape]
    //let shapeList: [Shape]
    var _factory = [] as [() -> Void]
    var no = 0
    
    init() {
        // init()함수의 목적은 초기화
        // -> 기본적으로 클래스내에서 무조건 실행됨.
        shapeList = [Circle(), Rectangle()]
        _factory = [menu, inputShape, showList, end]
    }
    
    func menu() {
        print("[1]입력 [2]목록 [3]종료")
        print("선택", terminator: ": ")
        no = Int(readLine() ?? "") ?? 0
    }
    
    func end() {
        print("프로세스를 종료합니다!")
    }
    
    func showList() {
        for shape in shapeList {
            shape.draw()
        }
        no = 0
    }
    
    func inputShape() {
        print("[1]Circle, [2]Rectangle")
        guard let choice = readLine(), let intChoice = Int(choice) else {
            print("잘못 입력하셨습니다.")
            return
        }
        appendShpe(choice: intChoice)
        no = 0
    }
    
    func showNewList(shapeList: [Shape]) {
        for shape in shapeList {
            shape.draw()
        }
    }
    
    //    let을 var로 변경 하면 수정 가능.
    func appendShpe(choice: Int) {
        //shapeList.append(choice == 1 ? Circle() : Rectangle() )
        
        if choice == 1 {
            shapeList.append(Circle())
        }
        if choice == 2 {
            shapeList.append(Rectangle())
        }
    }
    
    //    func appendShape(choice: Int, newShapeList: [Shape]) -> [Shape] {
    //        // 함수형 프로그래밍 방식
    //        var shape: Shape!
    //        if choice == 1 {
    //            shape = Circle()
    //        }
    //        if choice == 2 {
    //            shape = Rectangle()
    //        }
    //        return newShapeList.count > 2 ? newShapeList + [shape] : shapeList + newShapeList + [shape]
    //    }
    
    
    func main() {
        
        // 5회 반복 Shape 생성
        // 1번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle: 1
        // 리스트에 Circle 객체 추가 완료!
        // 2번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle: 2
        // 리스트에 Rectangle 객체 추가 완료!
        // 3번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle:
        
        //var newShapeList: [Shape] = []
        
        //        for i in 1...5 {
        //            print("\(i)번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle", terminator: ": ")
        //            let choice: Int = Int(readLine() ?? "") ?? 0
        //            appendShpe(choice: choice)
        //            //newShapeList = appendShape(choice: choice, newShapeList: newShapeList)
        //        }
        
        //showNewList(shapeList: newShapeList)
        
        
        
        // [1]입력 [2]목록 [3]종료
        // 선택: 1
        // [1]Circle [2]Rectangle
        // 선택: 2
        // Rectangle 추가 완료!
        // ----
        // [1]입력 [2]목록 [3]종료
        // 선택:
        
        while true {
            _factory[no]()
            
            //            if no == 1 {
            //                inputShape()
            //            }
            //            if no == 2 {
            //                showList()
            //            }
            if no == 3 {
                break
            }
            
        }
    }
}
