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

extension StopWatchViewViewModel {
    func startTimer() {
        timerIsRunning = true
        timerHasStarted = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { tempTimer in
            guard self.isActive else { return }
            
            self.progressValue += 1
            self.timeRemaining -= 1
        })
    }
    
    func continueTimer() {
        timerIsRunning = true
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { tempTimer in
            guard self.isActive else { return }
            
            self.progressValue += 1
            self.timeRemaining -= 1
        })
    }
    
    func pauseTimer() {
        timer?.invalidate()
        timer = nil
        
        timerIsRunning = false
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        
        timeRemaining = Int(maximumTime)
        progressValue = 0
        timerIsRunning = false
        timerHasStarted = false
    }
}
