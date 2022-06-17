//
//  HomeView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 17/06/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var selectedTag: Int = 1
    @State var dragOffset : CGFloat = .zero
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                HStack {
                    BookCategoryButton(title: "To read", tag: 0,
                                       width: geometry.size.width,
                                       selectedTag: $selectedTag) {
                        changeTag(tag: 0, width: geometry.size.width)
                    }
                    Spacer()
                    BookCategoryButton(title: "Reading", tag: 1,
                                       width: geometry.size.width,
                                       selectedTag: $selectedTag) {
                        changeTag(tag: 1, width: geometry.size.width)
                    }
                    Spacer()
                    BookCategoryButton(title: "Finished", tag: 2,
                                       width: geometry.size.width,
                                       selectedTag: $selectedTag) {
                        changeTag(tag: 2, width: geometry.size.width)
                    }
                }
                .padding(.top)
                .padding(.horizontal)
                .offset(x: dragOffset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            dragOffset = value.translation.width
                        }
                        .onEnded { value in
                            dragGestureEnded(xTranslation: value.translation.width,
                                             screenWidth: geometry.size.width)
                        }
                )
            }
            
            Spacer()
        }
    }
    
    func changeTag(tag: Int, width: CGFloat) {
        withAnimation {
            selectedTag = tag
            changeOffset(width: width)
        }
    }
    
    func changeOffset(width: CGFloat) {
        withAnimation {
            switch selectedTag {
            case 0:
                dragOffset = width / 3 + 16
            case 1:
                dragOffset = 0
            case 2:
                dragOffset = -width / 3 - 16
            default:
                dragOffset = 0;
            }
        }
    }
    
    func dragGestureEnded(xTranslation: CGFloat, screenWidth: CGFloat) {
        withAnimation(.spring()) {
            guard abs(xTranslation) > screenWidth/3 else {
                return
            }
            
            if xTranslation > 0 {
                if selectedTag >= 0 {
                    changeTag(tag: selectedTag - 1, width: screenWidth)
                } else {
                    changeTag(tag: 0, width: screenWidth)
                }
                changeOffset(width: screenWidth)
            } else if xTranslation < 0 {
                if selectedTag <= 2 {
                    changeTag(tag: selectedTag + 1, width: screenWidth)
                } else {
                    changeTag(tag: 2, width: screenWidth)
                }
                changeOffset(width: screenWidth)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
