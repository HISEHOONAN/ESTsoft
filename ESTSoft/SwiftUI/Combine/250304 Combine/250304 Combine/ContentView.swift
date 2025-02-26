//
//  ContentView.swift
//  250304 Combine
//
//  Created by 안세훈 on 2/26/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    let APInetwork = Network.shared
    
    var body: some View {
        VStack {
            Text(viewModel.author)
                .font(.title)
                .padding(.bottom, 5)
            Text(viewModel.authorProfile)
                .padding(.bottom, 5)
                .font(.title2)
            Text(viewModel.message)
                .font(.title3)
                .padding(.bottom, 5)
            Button("API 호출"){
                viewModel.fetchAdvice()
                viewModel.APIcount += 1
            }.padding()
            Text(String(viewModel.APIcount))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
