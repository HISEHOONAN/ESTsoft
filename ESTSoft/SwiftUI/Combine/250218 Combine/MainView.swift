//
//  View.swift
//  250218 Combine
//
//  Created by 안세훈 on 2/18/25.
//

import SwiftUI

struct MainView : View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("계정 정보")) {
                    TextField("이메일", text: $viewModel.email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                    
                    SecureField("비밀번호", text: $viewModel.password)
                    SecureField("비밀번호 확인", text: $viewModel.passwordConfirmation)
                }
                
                Section(header: Text("유효성 상태")) {
                    HStack {
                        Text("이메일 형식")
                        Spacer()
                        Image(systemName: viewModel.isEmailValid ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(viewModel.isEmailValid ? .green : .red)
                    }
                    
                    HStack {
                        Text("비밀번호 길이 (최소 8자)")
                        Spacer()
                        Image(systemName: viewModel.isPasswordValid ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(viewModel.isPasswordValid ? .green : .red)
                    }
                    
                    HStack {
                        Text("비밀번호 일치")
                        Spacer()
                        Image(systemName: viewModel.isPasswordMatch ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(viewModel.isPasswordMatch ? .green : .red)
                    }
                }
                
                Button(action: {
                    viewModel.signUp()
                }) {
                    Text("회원가입")
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .disabled(!viewModel.canSubmit)
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("회원가입")
        }
    }
    
}


#Preview {
    MainView()
}
