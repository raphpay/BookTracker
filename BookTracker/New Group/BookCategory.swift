//
//  BookCategory.swift
//  BookTracker
//
//  Created by Raphaël Payet on 23/06/2022.
//

import SwiftUI

struct BookCategory: Identifiable {
    let id = UUID()
    let text: String
    let color: Color
    let categoryName: BookCategoryName
}

var bookCategories = [
    BookCategory(text: "To read", color: .red, categoryName: .toRead),
    BookCategory(text: "Reading", color: .orange, categoryName: .reading),
    BookCategory(text: "Finished", color: .blue, categoryName: .finished),
]

enum BookCategoryName: String {
    case toRead, reading, finished
}

struct TabWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
