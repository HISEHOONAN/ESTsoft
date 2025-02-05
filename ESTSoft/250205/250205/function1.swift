//
//  function1.swift
//  250205
//
//  Created by 안세훈 on 2/5/25.
//

struct function1{
    
    func run(){
        print("runnning function1")
        
        let userinfo = getuserInfo()
        print("이름은 \(userinfo.name), 나이는 \(userinfo.age)입니다.")
    }
    
    func getuserInfo() -> (name : String, age : Int){
        print("이름",terminator: ": ")
        let name = readLine() ?? ""
        
        print("나이",terminator: ": ")
        let age = Int(readLine() ?? "") ?? 0
        
        return (name,age)
    }
    
}
