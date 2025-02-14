//
//  FileManager.swift
//  250213
//
//  Created by 안세훈 on 2/13/25.
//

import SwiftUI

struct FileManagerView: View {
    
    @State private var UserList: [UserModel] = []
    
    var body: some View {
        Text("사용자 목록").font(.largeTitle)
        VStack {
            List(UserList, id: \.UserId) { user in
                VStack(alignment: .leading) {
                    Text("이름: \(user.UserName)")
                    Text("나이: \(user.UserAge)")
                }
            }
            
            Button(action: saveSampleUsers) {
                Text("샘플 데이터 저장")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: loadSavedUsers) {
                Text("저장된 데이터 불러오기")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }.padding()
    }
    
    func saveSampleUsers() {
        let sampleUsers = [
            UserModel(UserId: UUID(), UserName: "세훈이", UserAge: 25),
            UserModel(UserId: UUID(), UserName: "세훈", UserAge: 27),
            UserModel(UserId: UUID(), UserName: "엉댕이", UserAge: 26),
            UserModel(UserId: UUID(), UserName: "방댕이", UserAge: 28)
        ]
        FileManagerHelper.shared.saveUserData(sampleUsers)
    }
    
    func loadSavedUsers() {
        UserList = FileManagerHelper.shared.loadUserData()
    }
}

#Preview {
    FileManagerView()
}
