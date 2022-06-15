//
//  ProgressCircle.swift
//  BookTracker
//
//  Created by Raphaël Payet on 15/06/2022.
//

import SwiftUI

struct ProgressCircle: View {
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            // TODO: Change the background color of the circle
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(Color.red)
            
            Circle()
                .trim(from: 0, to: CGFloat(min(progress, 1)))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(.red)
                .rotationEffect(Angle(degrees: 270))
                .animation(.linear, value: progress)
            
            Text("10 min left")
                .font(.largeTitle)
                .bold()
        }
    }
}


struct ProgressCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircle(progress: .constant(0.54))
    }
}
