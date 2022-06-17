//
//  HomeView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 16/06/2022.
//

import SwiftUI

struct HomeView: View {
    
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
                Text("Home")
                Spacer()
                
                HStack {
                    TabBarIcon(width: geometry.size.width/3, height: geometry.size.height/28,
                               icon: SFSymbols.home.rawValue, title: "Home")
                    TabBarIcon(width: geometry.size.width/3, height: geometry.size.height/28,
                               icon: SFSymbols.stopwatch.rawValue, title: "Reading")
                    TabBarIcon(width: geometry.size.width/3, height: geometry.size.height/28,
                               icon: SFSymbols.more.rawValue, title: "More")
                }
                .frame(width: geometry.size.width, height: geometry.size.height/8)
                .background(Color.black.opacity(0.5)).cornerRadius(10)
            }
        }
    }
}

struct TemporaryView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TabBarIcon: View {
    
    let width, height: CGFloat
    let icon, title: String
    
    var body: some View {
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
    }
}
