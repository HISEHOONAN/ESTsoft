//
//  Shape.swift
//  250206
//
//  Created by 안세훈 on 2/6/25.
//
import Foundation

class Shape{
    func draw(){
        print("도형을 그립니다.")
    }
}

let shapes : [Shape] = [Circle(),Rectangle()]

class Circle: Shape{
    override func draw() {
        print("1 : 원\n", terminator: "")
        print("반지름을 입력하세요.",terminator: ": ")
        var radius : Float = 0
        radius = Float(readLine() ?? "0") ?? 0
        print("원을 그립니다.")
        
        print("넓이 : ",radius * radius * 3.14)
        print("둘레 : ",2 * radius * 3.14)
    }
}

class Rectangle: Shape{
    override func draw() {
        print("2 : 직사각형\n", terminator: "")
        var height : Float = 0
        var width : Float = 0
        print("가로 입력하세요.",terminator: ": ")
        width = Float(readLine() ?? "0") ?? 0
        print("세로 입력하세요.",terminator: ": ")
        height = Float(readLine() ?? "0") ?? 0
        print("사각형을 그립니다.")
        print("넓이 : ", height * width)
        print("둘레 : ", 2 * (height + width))
    }
}
