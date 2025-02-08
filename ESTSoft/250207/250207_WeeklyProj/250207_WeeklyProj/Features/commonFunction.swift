//
//  commonFunction.swift
//  250207_WeeklyProj
//
//  Created by 안세훈 on 2/7/25.
//
class commonFunction {

    func inputDate(){
        print("날짜를 입력해주세요. (2025-01-01): ", terminator: "")
        guard let date = readLine() else { return }
        print("date: \(date)")
    }
    
    func inputContent(){
        print("내용을 입력해주세요: ", terminator: "")
        guard let content = readLine() else { return }
        print("content: \(content)")
    }
    
    func deleteContent(){
        
    }

    
}
