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
    let categoryName: ReadingCategory
    var books: [Book] = []
}

enum ReadingCategory: String {
    case toRead, reading, finished
    
    var name: String {
        switch self {
        case .toRead:
            return "To read"
        case .reading:
            return "Reading"
        case .finished:
            return "Finished"
        }
    }
}

var bookCategories = [
    BookCategory(text: "To read", color: .red, categoryName: .toRead, books: toReadBooks),
    BookCategory(text: "Reading", color: .orange, categoryName: .reading, books: readingBooks),
    BookCategory(text: "Finished", color: .blue, categoryName: .finished, books: finishedBooks),
]

var bookCategoryTypes = [
    ReadingCategory.toRead,
    ReadingCategory.reading,
    ReadingCategory.finished,
]


struct TabWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
