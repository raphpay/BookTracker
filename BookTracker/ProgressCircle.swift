//
//  ProgressCircle.swift
//  BookTracker
//
//  Created by Raphaël Payet on 15/06/2022.
//

import SwiftUI

struct ProgressCircle: View {
    @Binding var progress: Float
    let maximumTimeInS: Float
    var convertedProgress: Float {
        let total = progress/maximumTimeInS
        return total
    }
    @Binding var timeRemaining: Int
    var timeLeft: String {
        let (hours, minutes, seconds) = secondsToHoursMinutesSeconds(Int(timeRemaining))
        var string = ""
        if (hours > 0) {
            if (hours == 1) {
                string += "\(hours) heure "
            } else {
                string += "\(hours) heures "
            }
        }
        if (minutes > 0) {
            if (minutes == 1) {
                string += "\(minutes) minute "
            } else {
                string += "\(minutes) minutes "
            }
        }
        if (seconds > 0) {
            if (seconds == 1) {
                string += "\(seconds) seconde "
            } else {
                string += "\(seconds) secondes "
            }
        }
        
        return string
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(Color.ui.darkBlueGray)
            
            Circle()
                .trim(from: 0, to: CGFloat(min(convertedProgress, 1)))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.ui.darkBlueGray)
                .rotationEffect(Angle(degrees: 270))
                .animation(.linear, value: progress)
            
            Text(timeLeft)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding()
        }
    }
    
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
}


struct ProgressCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircle(progress: .constant(54), maximumTimeInS: 100, timeRemaining: .constant(8000))
    }
}
