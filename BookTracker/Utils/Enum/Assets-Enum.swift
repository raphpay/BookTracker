//
//  Assets-Enum.swift
//  BookTracker
//
//  Created by Raphaël Payet on 15/06/2022.
//

import Foundation

enum Assets {
    case dark, light
    case bookCover
    
    var name: String {
        switch self {
        case .dark:
            return "dark"
        case .light:
            return "light"
        case .bookCover:
            return "Book-Cover"
        }
    }
}
