//
//  StepperButton.swift
//  BookTracker
//
//  Created by Raphaël Payet on 13/07/2022.
//

import SwiftUI

struct StepperButton: View {
    
    var systemName: String
    var action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .font(.title)
                .frame(width: 35, height: 35)
                .foregroundColor(.ui.darkBlueGray)
        }
    }
}


struct StepperButton_Previews: PreviewProvider {
    static var previews: some View {
        StepperButton(systemName: "plus", action: {})
    }
}
