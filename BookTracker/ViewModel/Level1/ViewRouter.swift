//
//  ViewRouter.swift
//  BookTracker
//
//  Created by Raphaël Payet on 17/06/2022.
//

import Foundation

enum Page {
    case home
    case more
 }

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}
