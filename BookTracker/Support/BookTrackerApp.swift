//
//  BookTrackerApp.swift
//  BookTracker
//
//  Created by Raphaël Payet on 15/06/2022.
//

import SwiftUI
import RealmSwift

@main
struct BookTrackerApp: SwiftUI.App {
    
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            LocalOnlyContentView()
                .environmentObject(appState)
        }
    }
}

