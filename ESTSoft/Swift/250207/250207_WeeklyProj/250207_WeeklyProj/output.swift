//
//  output.swift
//  250207_WeeklyProj
//
//  Created by 안세훈 on 2/9/25.
//
import Foundation

class output {
    func Success(_ message: String) {
        print("[성공] \(message)")
    }
    
    func Error(_ message: String) {
        print("[오류] \(message)")
    }
    
    func printRetrospective(date: String, content: String) {
        print("""
        ==========================
        날짜: \(date)
        내용: \(content)
        ==========================
        """)
    }
}
