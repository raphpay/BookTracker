//
//  StopWatchView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 15/06/2022.
//

import SwiftUI

struct StopWatchView: View {
    
    @StateObject private var viewModel = StopWatchViewViewModel()
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        ZStack {
            
            Background()
            
            VStack {
                
                Text("Reading time")
                    .font(.title)
                    .bold()
                
                ProgressCircle(progress: $viewModel.progressValue, maximumTimeInS: viewModel.maximumTime, timeRemaining: $viewModel.timeRemaining)
                    .frame(width: 300, height: 300)
                    .padding()
                
                HStack {
                    if (viewModel.timerHasStarted) {
                        Button {
                            if (viewModel.timerIsRunning) {
                                viewModel.pauseTimer()
                            } else {
                                viewModel.continueTimer()
                            }
                        } label: {
                            if (viewModel.timerIsRunning) {
                                StopWatchButton(title: "Pause", color: .ui.corn)
                            } else {
                                StopWatchButton(title: "Continue")
                            }
                        }
                        
                        Spacer()

                        Button {
                            viewModel.stopTimer()
                        } label: {
                            StopWatchButton(title: "Stop", color: .ui.orchid)
                        }
                    } else {
                        Button {
                            viewModel.startTimer()
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
    }
}

struct StopWatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchView()
    }
}
