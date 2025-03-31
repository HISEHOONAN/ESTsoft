//
//  ContentView.swift
//  250331
//
//  Created by 안세훈 on 3/31/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        List(viewModel.UserInfo) { user in
            Text(user.name)
        }
        .onAppear {
            // 뷰가 나타날 때 API 호출 시작
            viewModel.fetchUserInfo()
        }
    }
}

#Preview {
    ContentView()
}
