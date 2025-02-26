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
            Text(viewModel.authorProfile)
            Text(viewModel.message)
            
            Button("API호출"){
                viewModel.fetchAdvice()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
