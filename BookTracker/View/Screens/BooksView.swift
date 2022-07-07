//
//  BooksView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 07/07/2022.
//

import SwiftUI

struct BooksView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            Button {
                withAnimation {
                    appState.showDetails = false
                }
            } label: {
                Text("Hello World")
            }

        }
    }
}

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView()
    }
}
