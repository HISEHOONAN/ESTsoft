//
//  function.swift
//  250205
//
//  Created by 안세훈 on 2/5/25.
//

struct function{
    
    func run(){
        print("run")
        firstfunction()
    }
    
    func firstfunction(){
        print("firstfunction is called")
        
        let value1 : Int = 100
        let value2 : Int = 200
        
        let total = add(x: value1, y: value2)
        
        print("\(value1) + \(value2) = \(total)")
    }
    
    func add(x : Int, y : Int) -> Int{
        return x + y
    }
    
}
