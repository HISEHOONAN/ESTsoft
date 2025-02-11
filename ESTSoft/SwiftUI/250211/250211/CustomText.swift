//
//  CustomText.swift
//  250211
//
//  Created by 안세훈 on 2/11/25.
//

import SwiftUI

struct CustomText: View {
    var body: some View {
        Text("SwiftUI 실습")
            .font(.largeTitle)
            .foregroundColor(.cyan)
            .padding()
            .background(Color.yellow)
            .cornerRadius(30) //백그라운드의 둥글기
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.blue, lineWidth: 4)
            ).padding()
    }
}
