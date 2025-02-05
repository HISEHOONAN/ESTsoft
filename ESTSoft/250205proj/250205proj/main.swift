//
//  main.swift
//  250205proj
//
//  Created by 안세훈 on 2/5/25.
//

import Foundation

var num : Int = 0
var loop = true

print("               :::: 전화번호부 ::::               ")
print("----------------------MENU--------------------")
print("1)INPUT 2)OUTPUT 3)SEARCH 4)EDIT 5)DELETE 6)END")

while loop{
    print("번호를 입력해주세요.",terminator:": ")
    num = Int(readLine() ?? "0") ?? 0
    switch num{
    case 1: features().input()
    case 2: features().output()
    case 3: features().search()
    case 4: features().edit()
    case 5: features().delete()
    case 6: print("프로그램을 종료합니다.")
        loop = false
    default:
        print("잘못된 번호 입니다.")
    }
}

