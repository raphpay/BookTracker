//
//  BookTrackerApp.swift
//  BookTracker
//
//  Created by Raphaël Payet on 15/06/2022.
//

import SwiftUI
//import RealmSwift

//@main
//struct BookTrackerApp: SwiftUI.App {
//
//    @StateObject var appState = AppState()
//
//    var body: some Scene {
//        WindowGroup {
//            LocalOnlyContentView()
//                .environmentObject(appState)
//        }
//    }
//}
//

//@main
//struct BookTrackerApp: App {
//  var body: some Scene {
//    WindowGroup {
//        NewContentView()
//    }
//  }
//}

@main
struct BookTrackerApp: App {

    @StateObject var appState = AppState()
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
                .environmentObject(appState)
        }
    }
}
