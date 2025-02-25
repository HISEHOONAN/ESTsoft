//
//  StopWatchView.swift
//  250225 Combine
//
//  Created by 안세훈 on 2/25/25.
//

import SwiftUI

struct StopWatchView: View {
    @State private var timeElapsed: TimeInterval = 0
    @State private var timer: Timer? = nil
    @State private var isRunning = false
    @State private var laps: [TimeInterval] = []
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                // 타이머 표시
                Text(timeString(timeElapsed))
                    .font(.system(size: 80, weight: .thin))
                    .foregroundColor(.white)
                    .monospacedDigit()
                    .padding(.top, 50)
                
                // 랩 타임 목록
                if !laps.isEmpty {
                    ScrollView {
                        VStack(spacing: 8) {
                            ForEach(0..<laps.count, id: \.self) { index in
                                HStack {
                                    Text("랩 \(laps.count - index)")
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text(timeString(laps[index]))
                                        .foregroundColor(.white)
                                        .monospacedDigit()
                                }
                                .padding(.horizontal)
                                
                                if index < laps.count - 1 {
                                    Divider()
                                        .background(Color.gray.opacity(0.3))
                                }
                            }
                        }
                        .padding()
                    }
                    .frame(maxHeight: 300)
                }
                
                Spacer()
                
                // 컨트롤 버튼
                HStack(spacing: 50) {
                    // 리셋/랩 버튼
                    Button(action: {
                        if isRunning {
                            // 스톱워치가 실행 중이면 랩 추가
                            laps.insert(timeElapsed, at: 0)
                        } else {
                            // 스톱워치가 중지된 상태면 리셋
                            timeElapsed = 0
                            laps.removeAll()
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 80, height: 80)
                            
                            Text(isRunning ? "랩" : "리셋")
                                .foregroundColor(isRunning ? .white : (timeElapsed > 0 ? .white : .gray))
                        }
                    }
                    .disabled(!isRunning && timeElapsed == 0)
                    
                    // 시작/중지 버튼
                    Button(action: {
                        if isRunning {
                            stopTimer()
                        } else {
                            startTimer()
                        }
                        isRunning.toggle()
                    }) {
                        ZStack {
                            Circle()
                                .fill(isRunning ? Color.red : Color.green)
                                .frame(width: 80, height: 80)
                            
                            Text(isRunning ? "중지" : "시작")
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.bottom, 50)
            }
        }
    }
    
    // 타이머 시작
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            timeElapsed += 0.01
        }
    }
    
    // 타이머 중지
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    // 시간을 문자열로 변환 (00:00.00 형식)
    private func timeString(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let milliseconds = Int((time.truncatingRemainder(dividingBy: 1)) * 100)
        
        return String(format: "%02d:%02d.%02d", minutes, seconds, milliseconds)
    }
}

#Preview {
    StopWatchView()
}
