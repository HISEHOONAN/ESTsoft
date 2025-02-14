//
//  TextFieldView.swift
//  250213
//
//  Created by 안세훈 on 2/13/25.
//

import SwiftUI

struct TextFieldView: View {
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            HStack{
                Text("이름")
                TextField("이름", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack{
                Text("이메일")
                TextField("이메일", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.emailAddress)
            }
            HStack{
                Text("비밀번호")
                TextField("비밀번호", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.emailAddress)
            }
            
            Text("입력한 이름: \(name)")
            
        }
        .padding()
    }
}

#Preview {
    TextFieldView()
}
