//
//  SearchCategory.swift
//  BookTracker
//
//  Created by Raphaël Payet on 03/07/2022.
//

import SwiftUI

enum SearchCategory: String, CaseIterable, Identifiable {
    case title, author, paperPublisher, isbn
    
    var id: String { return self.rawValue }
    
    var title: String {
        switch self {
        case .title:
            return "Title"
        case .author:
            return "Author"
        case .paperPublisher:
            return "Publisher"
        case .isbn:
            return "ISBN"
        }
    }
    
    var placeholder: String {
        switch self {
        case .title:
            return "Search by title"
        case .author:
            return "Search by author"
        case .paperPublisher:
            return "Search by publisher"
        case .isbn:
            return "Search by ISBN code"
        }
    }
    
    var tag: Int {
        switch self {
        case .title:
            return 0
        case .author:
            return 1
        case .paperPublisher:
            return 2
        case .isbn:
            return 3
        }
    }
    
    var color: Color {
        switch self {
        case .title:
            return .green
        case .author:
            return .red
        case .paperPublisher:
            return .blue
        case .isbn:
            return .purple
        }
    }
}
