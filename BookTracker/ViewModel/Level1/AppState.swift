//
//  AppState.swift
//  BookTracker
//
//  Created by Raphaël Payet on 07/07/2022.
//

import Foundation
import Combine

final class AppState: ObservableObject {
    @Published var showDetails: Bool = false
}
