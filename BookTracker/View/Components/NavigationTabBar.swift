//
//  NavigationTabBar.swift
//  BookTracker
//
//  Created by Raphaël Payet on 17/06/2022.
//

import SwiftUI

struct NavigationTabBar: View {
    
    @StateObject var viewRouter: ViewRouter
    let geometryWidth, geometryHeight: CGFloat
    
    var body: some View {
        HStack {
            TabBarIcon(viewRouter: viewRouter, assignedPage: .home,
                width: geometryWidth/3, height: geometryHeight/28,
                       icon: SFSymbols.home.rawValue, title: "Home")
            
            ZStack {
                Circle()
                    .foregroundColor(.white)
                    .frame(width: geometryWidth/7, height: geometryWidth/7)
                    .shadow(radius: 4)
                
                Image(systemName: SFSymbols.stopwatch.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: (geometryWidth/7)-18 , height: (geometryWidth/7)-18)
                    .foregroundColor(.ui.darkBlueGray)
            }
            .offset(y: -geometryHeight/8/2)
            
            TabBarIcon(viewRouter: viewRouter, assignedPage: .more,
                       width: geometryWidth/3, height: geometryHeight/28,
                       icon: SFSymbols.more.rawValue, title: "More")
        }
        .frame(width: geometryWidth, height: geometryHeight/8)
        .background(Color.black.opacity(0.2).shadow(radius: 2))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTabBar(viewRouter: ViewRouter(), geometryWidth: 400, geometryHeight: 600)
    }
}
