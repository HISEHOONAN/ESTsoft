//
//  main.swift
//  250205proj1
//
//  Created by 안세훈 on 2/5/25.
//

import Foundation

//MARK: - closure로 처리
let numArray : [Int] = [4,6,7,2,8,3,9]
print(numArray)

let multiplyArray : [Int] = numArray.map { $0 * 2 }
print(multiplyArray)

let sortedArray : [Int] = numArray.sorted { $0 < $1 }
print(sortedArray)

//MARK: - 함수로 처리
func gettriple(num : Int) -> Int {
    return num * 3
}
let tripleArray : [Int] = numArray.map(gettriple)
print(tripleArray)

func getSorted(a : Int, b : Int) -> Bool {
    return a > b
}
let sortedArray2 : [Int] = numArray.sorted(by: getSorted)
print(sortedArray2)
