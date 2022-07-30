//
//  TabBarIcon.swift
//  BookTracker
//
//  Created by Raphaël Payet on 17/06/2022.
//

import SwiftUI

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
            .foregroundColor(viewRouter.currentPage == assignedPage ? .black : .secondary)
        }
    }
}


struct TabBarIcon_Previews: PreviewProvider {
    static var previews: some View {
        TabBarIcon(viewRouter: ViewRouter(), assignedPage: .home, width: 50, height: 50, icon: SFSymbols.home.rawValue, title: "Home")
    }
}
