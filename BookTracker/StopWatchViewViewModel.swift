//
//  StopWatchViewViewViewModel.swift
//  BookTracker
//
//  Created by Raphaël Payet on 16/06/2022.
//

import Foundation
import SwiftUI

class StopWatchViewViewModel: ObservableObject {
    @Published var progressValue: Float = 0.0
    @Published var timerIsRunning: Bool = false
    @Published var timerHasStarted: Bool = false
    @Published var timeRemaining = 6
    @Published var isActive = true
    @Published var timer: Timer? = nil
    let maximumTime: Float = 6
}

// MARK: - Actions
extension StopWatchViewViewModel {
    func startTimer() {
        timerIsRunning = true
        timerHasStarted = true
        runTimer()
    }
    
    func continueTimer() {
        timerIsRunning = true
        runTimer()
    }
    
    func pauseTimer() {
        killTimer()
        timerIsRunning = false
    }
    
    func stopTimer() {
        killTimer()
        timeRemaining = Int(maximumTime)
        progressValue = 0
        timerIsRunning = false
        timerHasStarted = false
    }
}


// MARK: - Helper methods
extension StopWatchViewViewModel {
    func runTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { tempTimer in
            guard self.isActive else { return }
            
            self.progressValue += 1
            self.timeRemaining -= 1
        })
    }
    
    func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
