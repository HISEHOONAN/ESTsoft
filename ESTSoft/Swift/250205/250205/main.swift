//
//  main.swift
//  250205
//
//  Created by 안세훈 on 2/5/25.
//

import Foundation


var num : Int = 0

print("실행시킬 예제 번호를 입력하세요.",terminator: ": ")

num = Int(readLine() ?? "") ?? 0

switch num{
case 1:function().run()
case 2:function1().run()
case 3:function2()
default:print("유효하지 않은 번호입니다.")
}
