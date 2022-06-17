//
//  HomeView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 16/06/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewRouter: ViewRouter
    @State var showSheet: Bool = false
    
    var body: some View {
//        Button {
//            showSheet.toggle()
//        } label: {
//            Text("Go To Page counter view")
//        }
//        .sheet(isPresented: $showSheet) { PageCounterView() }
        
        GeometryReader { geometry in
            VStack {
                Spacer()
                switch viewRouter.currentPage {
                case .home:
                    Text("Home")
                case .stopwatch:
                    Text("Stopwatch")
                case .more:
                    Text("More")
                }
                Spacer()
                
                TabBar(viewRouter: viewRouter, geometryWidth: geometry.size.width, geometryHeight: geometry.size.height)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct TemporaryView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewRouter: ViewRouter())
    }
}
