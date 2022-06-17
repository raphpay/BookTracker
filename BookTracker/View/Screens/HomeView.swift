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
                
                HStack {
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .home,
                        width: geometry.size.width/3, height: geometry.size.height/28,
                               icon: SFSymbols.home.rawValue, title: "Home")
                    
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                            .shadow(radius: 4)
                        
                        Image(systemName: SFSymbols.stopwatch.rawValue)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: (geometry.size.width/7)-18 , height: (geometry.size.width/7)-18)
                            .foregroundColor(.ui.darkBlueGray)
                    }
                    .offset(y: -geometry.size.height/8/2)
                    
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .more,
                               width: geometry.size.width/3, height: geometry.size.height/28,
                               icon: SFSymbols.more.rawValue, title: "More")
                }
                .frame(width: geometry.size.width, height: geometry.size.height/8)
                .background(Color.black.opacity(0.2).shadow(radius: 2))
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

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    let width, height: CGFloat
    let icon, title: String
    
    var body: some View {
        Button {
            viewRouter.currentPage = assignedPage
        } label: {
            VStack {
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                    .padding(.top, 10)
                Text(title)
                    .font(.footnote)
                Spacer()
            }
            .foregroundColor(.black)
        }
    }
}
