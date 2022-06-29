//
//  HomeView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 16/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouter
    @State var showSheet: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                switch viewRouter.currentPage {
                case .home:
                    HomeView()
                case .more:
                    MoreView()
                }
                Spacer()
                
                NavigationTabBar(viewRouter: viewRouter,
                                 geometryWidth: geometry.size.width,
                                 geometryHeight: geometry.size.height,
                                 showSheet: $showSheet)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .sheet(isPresented: $showSheet) {
            StopWatchView()
        }
        .onAppear {
            NetworkService.shared.fetchBooksTest()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
