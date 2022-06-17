//
//  Background.swift
//  BookTracker
//
//  Created by Raphaël Payet on 16/06/2022.
//

import SwiftUI

struct Background: View {
    
    // TODO: Handle light and dark mode
    var isLight: Bool = true
    
    var body: some View {
        Image(isLight ? Assets.light.name : Assets.dark.name)
            .resizable()
            .edgesIgnoringSafeArea(.all)
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
