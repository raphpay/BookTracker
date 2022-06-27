//
//  HomeViewViewModel.swift
//  BookTracker
//
//  Created by Raphaël Payet on 17/06/2022.
//

import Foundation
import SwiftUI

class HomeViewViewModel: ObservableObject {
    @Published var selectedBook: BookCategory.BookCategoryType = .reading
    @Published var selectedColor: Color = .orange
    @Published var tabWidth: CGFloat = 0
    @Published var selectedId = bookCategories[1].id
    @Published var showAddBookSheet: Bool = false
}

extension HomeViewViewModel {
    func setStates(from id: UUID) {
        guard let category = bookCategories.first(where: { $0.id == id}) else { return }
        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
            self.selectedBook = category.categoryName
            self.selectedColor = category.color
        }
    }
    
    func setStates(from category: BookCategory) {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
            selectedBook = category.categoryName
            selectedColor = category.color
            selectedId = category.id
        }
    }
}
