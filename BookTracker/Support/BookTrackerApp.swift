//
//  BookTrackerApp.swift
//  BookTracker
//
//  Created by Raphaël Payet on 15/06/2022.
//

import SwiftUI

@main
struct BookTrackerApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            HomeView(viewRouter: viewRouter)
        }
    }
}
