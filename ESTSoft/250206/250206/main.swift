//
//  main.swift
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

class Circle: Shape{
    override func draw() {
        print("원을 그립니다.")
    }
}

class Retangle: Shape{
    override func draw() {
        print("사각형을 그립니다.")
    }
}

let shapes : [Shape] = [Circle(),Retangle()]

for shape in shapes{
    shape.draw()
}
