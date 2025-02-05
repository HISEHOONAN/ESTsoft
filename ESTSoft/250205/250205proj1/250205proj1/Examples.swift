//
//  Examples.swift
//  250205proj1
//
//  Created by 안세훈 on 2/5/25.
//

class Examples{
    //MARK: - 부모 - 자식 함수
    
    func Ex01(){
        func parentfunc(){
            print("called parentfunc")
            
            func childfunc(){
                print("called childfunc")
            }
            
            childfunc()
            
            let refFuc = childfunc
            
            refFuc()
        }
    }
    
    func Ex02(){
        //MARK: - 기본적인 함수 형태
        func multiply(a : Int, b : Int) -> Int{
            let result = a * b
            return result
        }
        let multiplyResult = multiply(a: 10, b: 20)
        print(multiplyResult)
        
        //MARK: - 클로저 함수 형태
        // { (매개변수) -> 리턴형 in 리턴 }
        let multiplyClosure = { (a : Int, b : Int) -> Int in a * b}
        let multiplyClosureResult = multiplyClosure(10, 20)
        print(multiplyClosureResult)
        
    }
}
