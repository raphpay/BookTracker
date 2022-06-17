//
//  ProgressArcCircle.swift
//  BookTracker
//
//  Created by Raphaël Payet on 17/06/2022.
//

import SwiftUI

struct ProgressArcCircle: View {
    
    @Binding var completionAmount: Float
    let maxCompletionAmount: CGFloat = 0.5
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: maxCompletionAmount)
                .stroke(Color.ui.darkBlueGray.opacity(0.5), lineWidth: 20)
                .rotationEffect(.degrees(180))
            
            Circle()
                .trim(from: 0, to: CGFloat(completionAmount))
                .stroke(Color.ui.orchid, lineWidth: 20)
                .rotationEffect(.degrees(180))
        }

    }
}


struct ProgressArcCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressArcCircle(completionAmount: .constant(0.23))
    }
}
