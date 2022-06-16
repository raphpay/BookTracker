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
    @Published var hasStarted: Bool = false
    @Published var timeRemaining = 6
    @Published var isActive = true
    let maximumTime: Float = 6
    let timer = Timer.publish(every: 1, on: .main, in: .common)
}

extension StopWatchViewViewModel {
    func startTimer() {
        hasStarted = true
        let _ = timer.connect()
    }
    
    func pauseTimer() {
        // TODO: Create action
    }
    
    func stopTimer() {
        // TODO: Create action
    }
    
    func onReceiveTimer() {
        guard isActive else { return }
        
        if (timeRemaining > 0) {
            timeRemaining -= 1
            progressValue += 1
        }
    }
    
    func onChangeScenePhase(_ newPhase: ScenePhase) {
        if newPhase == .active {
            isActive = true
        } else {
            isActive = false
        }
    }
}
