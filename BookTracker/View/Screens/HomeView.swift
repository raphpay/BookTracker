//
//  HomeView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 17/06/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var selectedTag: Int = 1
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                HStack {
                    BookCategoryButton(title: "To read", tag: 0,
                                       width: geometry.size.width,
                                       selectedTag: $selectedTag)
                    Spacer()
                    BookCategoryButton(title: "Reading", tag: 1,
                                       width: geometry.size.width,
                                       selectedTag: $selectedTag)
                    Spacer()
                    BookCategoryButton(title: "Finished", tag: 2,
                                       width: geometry.size.width,
                                       selectedTag: $selectedTag)
                }
            }
            .padding(.top)
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
