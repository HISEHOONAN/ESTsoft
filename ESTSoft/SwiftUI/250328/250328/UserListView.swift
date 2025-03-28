//
//  UserListView.swift
//  250328
//
//  Created by 안세훈 on 3/28/25.
//


import SwiftUI

struct UserListView: View {
    @EnvironmentObject var viewModel: UserViewModel
    @State private var newName: String = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("이름 입력", text: $newName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("추가") {
                        guard !newName.trimmingCharacters(in: .whitespaces).isEmpty else { return }
                        viewModel.addUser(name: newName)
                        newName = ""
                    }
                }
                .padding()

                List {
                    ForEach(viewModel.users) { user in
                        UserRowItem(user: user)
                    }
                    .onDelete(perform: viewModel.deleteUser)
                }
            }
            .navigationTitle("사용자 목록")
            .toolbar {
                EditButton() // 삭제 기능 활성화 버튼
            }
        }
    }
}
