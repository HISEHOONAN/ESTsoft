//
//  ContentView.swift
//  250414
//
//  Created by 안세훈 on 4/14/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "시작 전"
    
    var body: some View {
        VStack(spacing: 20) {
            Text(message)
                .font(.title2)
            
            Button("Task 실행") {
                Task {
                     await runTask1()
                }
            }
            
            Button("실패 Task 실행") {
                Task {
                    try await runFailingTask()
                }
            }
        }
        .padding()
    }
    
    //MARK: - async await

    //비동기 작업
    func runTask1() async {
        print(#file, #function, #fileID ,"Task1 실행")
        message = "Task1 메세지"
        do{
            let result = try await task1()
            print(">>> fulfilled : \(result.data),\(result.num)")
        }catch{
            print(">>> rejected : \(error.localizedDescription)")
            message = "에러 : \(error.localizedDescription)"
        }
    }
    
    func task1() async throws -> (data : String, num : Int){
        var num = 0
        print("task내부 작업 시작", num)
        try await Task.sleep(nanoseconds: 2000_000_000)
        num = 1004
        print("task내부 작업 끝", num)
        return (data : "task1결과", num)
    }
    
    //비동기 작업 실패시 처리
    func runFailingTask() async throws {
        print("실패 Task 시작")
        message = "실패 Task 실행중.."
        
        do{
            let result = try await failingTask()
            print(">>> fulfilled : \(result)")
            message = "성공 : \(result)"
        }catch{
            print(">>> rejected : \(error.localizedDescription)")
            message = "에서 발생 : \(error.localizedDescription)"
        }
    }
    
    func failingTask() async throws -> String{
        try await Task.sleep(nanoseconds: 2000_000_000)
        throw NSError(domain: "TaskError", code: 999, userInfo: [NSLocalizedDescriptionKey : "에러 메세지"])
    }
    
    
}

#Preview {
    ContentView()
}
