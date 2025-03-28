//
//  ReportView.swift
//  250327
//
//  Created by 안세훈 on 3/27/25.
//


import SwiftUI

struct ReportView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("📊 도민준 리포트 공유하기")
                .font(.title2)
                .bold()
            Divider()
            Text("할 일 완료: 12개")
            Text("집중 시간: 7시간 45분")
            Text("새로운 목표: 3개")
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 3))
    }
}
