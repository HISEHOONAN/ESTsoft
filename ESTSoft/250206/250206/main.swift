//
//  main.swift
//  250206
//
//  Created by 안세훈 on 2/6/25.
//

import Foundation

var menu = 0
var radius = 0
var height = 0
var width = 0

print("도형을 선택해주세요.\n1번 원\n2번 직사각형",terminator: "")
menu = Int(readLine() ?? "0") ?? 0

switch menu{
case 1: shapes[0].draw()
case 2: shapes[1].draw()
default:
    print("잘못입력하셨습니다.")
}


//for shape in shapes{
//    shape.draw()
//}
