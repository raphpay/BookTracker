//
//  Library.swift
//  BookTracker
//
//  Created by Raphaël Payet on 23/06/2022.
//

import SwiftUI

struct TabWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

enum Library: String, CaseIterable, Identifiable {
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
    
    // TODO: To be removed if not used
    var tag: Int {
        switch self {
        case .toRead:
            return 0
        case .reading:
            return 1
        case .finished:
            return 2
        }
    }
    
    var id: String { return self.rawValue }
    
    var color: Color {
        switch self {
        case .toRead:
            return .red
        case .reading:
            return .orange
        case .finished:
            return .blue
        }
    }
}
