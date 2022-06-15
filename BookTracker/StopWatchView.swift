//
//  StopWatchView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 15/06/2022.
//

import SwiftUI

struct StopWatchView: View {
    
    @State var progressValue: Float = 0.0
    
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
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchView()
    }
}
