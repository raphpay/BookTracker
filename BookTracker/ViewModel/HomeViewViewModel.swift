//
//  HomeViewViewModel.swift
//  BookTracker
//
//  Created by Raphaël Payet on 17/06/2022.
//

import Foundation
import SwiftUI

class HomeViewViewModel: ObservableObject {
    @Published var selectedLibrary: Library = .reading
    @Published var selectedColor: Color = .orange
    @Published var tabWidth: CGFloat = 0
    @Published var selectedId = Library.reading.id
    @Published var showAddBookSheet: Bool = false
}

extension HomeViewViewModel {
    func setStates(from id: String) {
        guard let library = Library.allCases.first(where: { $0.id == id}) else { return }
        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
            self.selectedLibrary = library
            self.selectedColor = library.color
        }
    }
    
    func setStates(from library: Library) {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
            selectedLibrary = library
            selectedColor = library.color
            selectedId = library.id
        }
    }
}
