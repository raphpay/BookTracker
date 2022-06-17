//
//  HomeView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 17/06/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewViewModel()
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                HStack {
                    BookCategoryButton(title: "To read", tag: 0,
                                       width: geometry.size.width,
                                       selectedTag: $viewModel.selectedTag) {
                        viewModel.changeTag(tag: 0, width: geometry.size.width)
                    }
                    Spacer()
                    BookCategoryButton(title: "Reading", tag: 1,
                                       width: geometry.size.width,
                                       selectedTag: $viewModel.selectedTag) {
                        viewModel.changeTag(tag: 1, width: geometry.size.width)
                    }
                    Spacer()
                    BookCategoryButton(title: "Finished", tag: 2,
                                       width: geometry.size.width,
                                       selectedTag: $viewModel.selectedTag) {
                        viewModel.changeTag(tag: 2, width: geometry.size.width)
                    }
                }
                .padding(.top)
                .padding(.horizontal)
                .offset(x: viewModel.dragOffset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            viewModel.dragTranslationChanged(value: value.translation.width)
                        }
                        .onEnded { value in
                            viewModel.dragGestureEnded(xTranslation: value.translation.width,
                                             screenWidth: geometry.size.width)
                        }
                )
            }
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
