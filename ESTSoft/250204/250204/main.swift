//
//  main.swift
//  250204
//
//  Created by 안세훈 on 2/4/25.
//

import Foundation

//MARK: - 사용자로부터 점수를 입력받아 배열에 저장하고, 배열의 평균 점수를 출력하세요.
var scores: [Int] = []
var count : Int = 0

print("몇개의 숫자를 입력 받으시겠습니까?",terminator: "")
count = Int(readLine() ?? "0") ?? 0

for _ in 1...count {
    print("\(count)개의 숫자를 입력해주세요.",terminator: "")
    if let input = readLine(), let score = Int(input) {
        scores.append(score)
    }
}
let sum = scores.reduce(0, +)
let average = sum / scores.count

print("평균 점수: \(average)")



//MARK: - 사용자로부터 국가 이름을 입력받아 해당 국가의 수도를 출력하는 프로그램을 작성하세요.
let capitals = ["Korea": "Seoul", "Japan": "Tokyo", "USA": "Washington, D.C."]
print("영어로 국가 이름을 입력하세요.",terminator: "")

// 사용자 입력
if let country = readLine() {
    if let capital = capitals[country] {
        print("\(country)의 수도는 \(capital)입니다.")
    } else {
        print("수도 정보를 찾을 수 없습니다.")
    }
}


//MARK: - 두 개의 숫자 셋을 입력받아 합집합, 교집합, 차집합을 출력하는 프로그램을 작성하세요.

let setA: Set = [1, 2, 3, 4, 5]
let setB: Set = [4, 5, 6, 7, 8]

print("합집합: \(setA.union(setB))") //합집합 A + B
print("교집합: \(setA.intersection(setB))") //교집합 A U B
print("차집합: \(setA.subtracting(setB))") //차집합 A - B
