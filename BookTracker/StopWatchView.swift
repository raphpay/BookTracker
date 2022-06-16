//
//  StopWatchView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 15/06/2022.
//

import SwiftUI

struct StopWatchView: View {
    
    @State var progressValue: Float = 0.0
    @State var hasStarted: Bool = false
    @State var timeRemaining = 6
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    let maximumTime: Float = 6
    let timer = Timer.publish(every: 1, on: .main, in: .common)
    
    var body: some View {
        ZStack {
            Image(Assets.light.name)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Reading time")
                    .font(.title)
                    .bold()
                
                ProgressCircle(progress: $progressValue, maximumTimeInS: maximumTime, timeRemaining: $timeRemaining)
                    .frame(width: 300, height: 300)
                    .padding()
                
                HStack {
                    if (hasStarted) {
                        Button {
                            pauseTimer()
                        } label: {
                            StopWatchButton(title: "Pause", color: .ui.corn)
                        }
                        
                        Spacer()

                        Button {
                            stopTimer()
                        } label: {
                            StopWatchButton(title: "Stop", color: .ui.orchid)
                        }
                    } else {
                        Button {
                            startTimer()
                        } label: {
                            StopWatchButton(title: "Start")
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top, 40)
        }
        .onReceive(timer) { time in
            guard isActive else { return }
            
            if (timeRemaining > 0) {
                timeRemaining -= 1
                progressValue += 1
            }
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                isActive = true
            } else {
                isActive = false
            }
        }
    }
    
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchView()
    }
}
