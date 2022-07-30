//
//  StopWatchButton.swift
//  BookTracker
//
//  Created by Raphaël Payet on 15/06/2022.
//

import SwiftUI

struct StopWatchButton: View {
    
    let title: String
    var color: Color = Color.ui.lightBlue
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 110, height: 110)
                .foregroundColor(color)
            
            Circle()
                .stroke()
                .frame(width: 110, height: 110)
                .foregroundColor(.black)
            
            Text(title)
                .font(.title2)
                .foregroundColor(.black)
        }
    }
}

struct StopWatchButton_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchButton(title: "Start", color: Color.ui.lightBlue)
    }
}
