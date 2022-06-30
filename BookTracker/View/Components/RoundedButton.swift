//
//  RoundedButton.swift
//  BookTracker
//
//  Created by Raphaël Payet on 29/06/2022.
//

import SwiftUI

struct RoundedButton: View {
    
    var title: String
    @Binding var showButton: Bool
    var action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.title2)
                .frame(width: 225, height: 55)
                .foregroundColor(.white)
                .background(showButton ? .blue : .gray.opacity(0.5))
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                .disabled(!showButton)
        }

    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(title: "Button", showButton: .constant(false)) {
            print("Button Tapped")
        }
    }
}
