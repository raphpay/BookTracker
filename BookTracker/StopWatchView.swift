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
    let totalTimeInSec = 600
    
    var body: some View {
        ZStack {
            Image(Assets.light.name)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Reading time")
                    .font(.title)
                    .bold()
                
                ProgressCircle(progress: $progressValue)
                    .frame(width: 300, height: 300)
                    .padding()
                
                HStack {
                    if (hasStarted) {
                        Button {
                            pauseTimer()
                        } label: {
                            StopWatchButton(title: "Pause")
                        }
                        
                        Spacer()

                        Button {
                            stopTimer()
                        } label: {
                            StopWatchButton(title: "Stop")
                        }
                    } else {
                        Button {
                            startTimer()
                        } label: {
                            StopWatchButton(title: "Start", color: .green)
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top, 40)
        }
    }
    
    func startTimer() {
        hasStarted = true
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
