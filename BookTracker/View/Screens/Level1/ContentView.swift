//
//  HomeView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 16/06/2022.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @EnvironmentObject var appState: AppState
    @StateObject var viewRouter: ViewRouter
    @ObservedRealmObject var group: BookGroup
    @State var showSheet: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                switch viewRouter.currentPage {
                case .home:
                    HomeView(group: group)
                case .more:
                    MoreView()
                }
                
                NavigationTabBar(viewRouter: viewRouter,
                                 geometryWidth: geometry.size.width,
                                 geometryHeight: geometry.size.height,
                                 showSheet: $showSheet)
                .offset(y: appState.showDetails ? 200 : 0)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .sheet(isPresented: $showSheet) {
            StopWatchView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter(), group: BookGroup())
    }
}
