//
//  View.swift
//  250206
//
//  Created by 안세훈 on 2/6/25.
//

import Foundation


class ShapeView {
    var shapes : [Shape]
    
    init(){
        shapes = [Circle(),Rectangle()]
    }
    
    func showlist(){
        for shape in shapes {
            shape.draw()
        }
    }
    
    func appendlist(choice : Int){
        
        if choice == 1{
            shapes.append(Circle())
        }else{
            shapes.append(Rectangle())
        }
        
        
    }
    
    
    func main(){
        for i in 1...5{
            print("\(i)번째 추가할 모양 타입 1:원 2:사각형",terminator: ": ")
            let choice = Int(readLine() ?? "0") ?? 0
            appendlist(choice: choice)
            
        }
        showlist()
    }
    
}
