//
//  Assets-Enum.swift
//  BookTracker
//
//  Created by Raphaël Payet on 15/06/2022.
//

import Foundation

enum Assets {
    case dark, light
    
    var name: String {
        switch self {
        case .dark:
            return "dark"
        case .light:
            return "light"
        }
    }
}
