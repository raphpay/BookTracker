//
//  HomeViewViewModel.swift
//  BookTracker
//
//  Created by Raphaël Payet on 17/06/2022.
//

import Foundation
import SwiftUI

class HomeViewViewModel: ObservableObject {
    @Published var selectedTag: Int = 1
    @Published var dragOffset : CGFloat = .zero
}

extension HomeViewViewModel {
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
    
    func dragTranslationChanged(value: CGFloat) {
        dragOffset = value
    }
}
