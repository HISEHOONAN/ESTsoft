//
//  ContentView.swift
//  250428
//
//  Created by 안세훈 on 4/28/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ARViewModel()

    var body: some View {
        ZStack {
            ARViewContainer(viewModel: viewModel)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                HStack {
                    Button("Rotate Box") {
                        viewModel.rotateBox()
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(12)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
