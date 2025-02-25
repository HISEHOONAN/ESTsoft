//
//  ViewModel.swift
//  250225 Combine
//
//  Created by 안세훈 on 2/24/25.
//
import SwiftUI
import Combine

class ViewModel: ObservableObject {
    
    @Published var timeString: String = "00:00.00"
    @Published var isRunning = false
    @Published var laps: [String] = []
    
    private var timer: AnyCancellable?
    private var startTime: Date?
    private var elapsedTime: TimeInterval = 0
    
    private func updateTime() {
        guard let startTime = startTime else { return }
        elapsedTime = Date().timeIntervalSince(startTime)
        timeString = formatTime(elapsedTime)
    }
    
    func startStop() {
        if isRunning {
            stop()
        } else {
            start()
        }
    }
    
    private func start() {
        startTime = Date() - elapsedTime
        isRunning = true
        timer = Timer.publish(every: 0.01, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateTime()
            }
    }
    
    private func stop() {
        isRunning = false
        timer?.cancel()
    }
    
    
    func lap() {
        if isRunning {
            laps.append(timeString)
        }
    }
    
    func reset() {
        stop()
        elapsedTime = 0
        timeString = "00:00.00"
        laps.removeAll()
    }
    
    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let milliseconds = Int((time - Double(minutes * 60) - Double(seconds)) * 100)
        return String(format: "%02d:%02d.%02d", minutes, seconds, milliseconds)
    }
}
