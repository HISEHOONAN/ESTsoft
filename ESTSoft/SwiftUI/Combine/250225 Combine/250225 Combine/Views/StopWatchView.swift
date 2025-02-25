//
//  StopWatchView.swift
//  250225 Combine
//
//  Created by 안세훈 on 2/25/25.
//

import SwiftUI

struct StopwatchView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack { 
            Text(viewModel.timeString)
                .font(.largeTitle)
                .padding()
            
            HStack {
                Button(action: { viewModel.lap() }) {
                    Text("Lap")
                        .frame(width: 80, height: 40)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                .disabled(!viewModel.isRunning)
                
                Button(action: { viewModel.startStop() }) {
                    Text(viewModel.isRunning ? "Stop" : "Start")
                        .frame(width: 80, height: 40)
                        .background(viewModel.isRunning ? Color.red : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: { viewModel.reset() }) {
                    Text(viewModel.isRunning ? "reset" : "reset")
                        .frame(width: 80, height: 40)
                        .background(viewModel.isRunning ? Color.red : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
            }
            .padding()
            
            List(viewModel.laps, id: \..self) { lap in
                Text(lap)
            }
        }
        .padding()
    }
}

#Preview {
    StopwatchView()
        .environmentObject(ViewModel())
}

