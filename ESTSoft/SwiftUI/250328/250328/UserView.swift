//
//  UserView.swift
//  250328
//
//  Created by 안세훈 on 3/28/25.
//


import SwiftUI

struct UserView: View {
    @EnvironmentObject var viewModel: UserViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("사용자 이름: \(viewModel.users)")
                .font(.title)

            Button("이름 변경") {
                viewModel.updateUsername(to: "새로운 사용자")
            }
        }
        .padding()
    }
}
