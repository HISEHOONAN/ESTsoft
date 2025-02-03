//
//  main.swift
//  Swift_EX01
//
//  Created by 안세훈 on 1/22/25.
//

import Foundation

////MARK: - 구구단
//for i in 1...9{
//    print("\n\(i)단")
//    for j in 1...9{
//        print("\(i) x \(j) = \(i*j)")
//    }
//}
//
////MARK: - 현재 시간 - 3
//let date = Date()
//print(date)
//
////MARK: - 유저디폴트
//UserDefaults.standard.set("Hello World", forKey: "test")
//print(UserDefaults.standard.string(forKey: "test") ?? "Not Found")
//
////MARK: - 옵셔널
////let optionalString: String? = "Hello"
//let optionalString: String? = nil
//
//if let unwrappedString = optionalString {
//    print(unwrappedString)
//} else {
//    print("optionalString is nil")
//}


//print("점수를 입력하세요:")
//
//if let input = readLine(), let score = Int(input) {
//    switch score {
//    case 90...100:
//        print("점수는 \(score), 학점: A")
//    case 80..<90:
//        print("점수는 \(score), 학점: B")
//    case 70..<80:
//        print("점수는 \(score), 학점: C")
//    case 60..<70:
//        print("점수는 \(score), 학점: D")
//    case ..<60:
//        print("점수는 \(score), 학점: F")
//    default:
//        print("점수는 \(score), 학점: S")
//    }
//} else {
//    print("유효한 숫자를 입력하세요.")
//}

//var num1 = 0
//var num2 = 1
//var nextnum = 0
//var i = 0
//var array = [Int]()
//var sum = 0
//
//array.append(num1)
//array.append(num2)
//
//while i < 20 {
//    nextnum = num1 + num2
//    array.append(nextnum)
//    num1 = num2
//    num2 = nextnum
//    i = i + 1
//    sum = num1 + num2 + nextnum
//}
//print("피보나치 수열 : ",array)
//print("합계 : ", sum)


//var num = Int.random(in: (1...100))
//
//print("::: 스무고개가 아닌 여섯고개 :::")
//print("숫자를 입력해주세요 ! ",terminator: " ")
//
//var YN : String
//repeat{
//    print("게임을 시작합니다.")
//    var count : Int = 6
//    for _ in 1...count{
//        count = count - 1
//        let answer : String = readLine() ?? ""
//        var answerInt : Int
//        answerInt = Int(answer) ?? 0
//        print("\(count)번 남았습니다.")
//        if num > answerInt{
//            print("\(answer))보다 높습니다.")
//        }else if num < answerInt{
//            print("\(answerInt))보다 낮습니다.")
//        }else{
//            print("정답입니다.")
//            print("\(count + 1)번 만에 맞추셨습니다.")
//        }
//
//        if count == 0{
//            print("실패!")
//        }
//    }
//
//    print("다시 시작하시겠습니까?(y/n)")
//    YN = readLine() ?? ""
//
//}while YN != "y" && YN != "Y" && YN != "n" && YN != "N"




//1월부터 12월까지의 일 수

//let monthDays: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
//var month: Int = 0
//var days: Int = 0
//var total: Int = 0
//
//print("월 입력 : ", terminator: "")
//month = Int(readLine() ?? "") ?? 0
//
//print("일 입력 : ", terminator: "")
//days = Int(readLine() ?? "") ?? 0
//
//if month > 12 || month < 0 || days > monthDays[month - 1] || days <= 0{
//    print("월 또는 일을 잘못 입력하셨습니다.")
//}else{
//    if month == 1{
//        print("1월 1일부터 1월 \(days)일 까지의 누적일은 \(days)일입니다.")
//    }else if month == 2{
//        total = 31 + days
//        print("1월 1일부터 2월 \(days)일 까지의 누적일은 \(total)일입니다.")
//    }
//    else{
//        for i in 0...month - 2{
//            total = total + monthDays[i]
//        }
//        total = total + days
//        print("1월 1일부터 \(month)월 \(days)일 까지의 누적일은 \(total)일입니다.")
//    }
//}


//print("날짜 수를 알고자 하는 달 입력: ", terminator: "")
//month = Int(readLine() ?? "") ?? 0
//days = monthDays[month - 1]
//print("결과 \(month)월은 \(days)일까지 있다.")

// 중요: 1) 반복해서 구현 해보기, 2) 머리를 믿지말고 그림을 그리기
// 생각이 바뀌면 행동이 바뀌고
// 행동이 반복되면 습관이 된다.
// 습관이 바뀌면 운명이 바뀐다.

// monthDays를 이용해서 "1년은 365일까지 있다"는것을 출력
// total변수에 monthDays의 모든 요소를 for in으로 누적
//var cnt = 1
// 인덱스와 요소를 같이 뽑아 온다.
// cnt = cnt + 1   <--- cnt += 1

//for (i, day) in monthDays.enumerated() {
//    print("monthDays[\(i)] = \(day)")
//}

//total = 0
//for i in 0..<monthDays.count {
//    total += monthDays[i]
//    print(i, i+1, monthDays[i], total)
//}


//let monthDays: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
//
//var beforemonth: Int = 0
//var beforeday: Int = 0
//
//var aftermonth: Int = 0
//var afterday: Int = 0
//
//var remainday = 100
//
//print("월 입력 : ", terminator: "")
//beforemonth = Int(readLine() ?? "") ?? 0
//
//print("일 입력 : ", terminator: "")
//beforeday = Int(readLine() ?? "") ?? 0
//
//afterday = beforeday + remainday //100일 후의 일은 시작일과 100일의 합이다.
//aftermonth = beforemonth // while연산을 위해 시작달로 초기화를 해주자.
//
//while afterday > monthDays[aftermonth - 1] { //각 달의 일수보다 클 경우만 적용!
//    afterday = afterday - monthDays[aftermonth - 1] //100일과 더한 일수에 시작 달부터 일수를 빼주자.
//    aftermonth = aftermonth + 1 // 연산을 했으니 월도 넘겨주자.
//    
//    if aftermonth > 12{ //해가 넘어감
//        aftermonth = aftermonth - 12
//        if afterday == 0{
//            afterday = afterday + 1
//        }
//    }
//}
//
//print("\(beforemonth)월 \(beforeday)일부터 100일 후는 \(aftermonth)월 \(afterday - 1)일 입니다.")


