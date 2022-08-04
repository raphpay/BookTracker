//
//  HomeViewViewModel.swift
//  BookTracker
//
//  Created by Raphaël Payet on 17/06/2022.
//

import Foundation
import SwiftUI
import RealmSwift

class HomeViewViewModel: ObservableObject {
    @Published var selectedLibrary: Library = .reading
    @Published var selectedColor: Color = .orange
    @Published var tabWidth: CGFloat = 0
    @Published var selectedPage = Library.reading.tag
    @Published var showAddBookSheet: Bool = false
    @Published var selectedIndex: Int = 0
    
    @ObservedResults(Book.self, where: { $0.library == Library.toRead.rawValue })   var toReadBooks
    @ObservedResults(Book.self, where: { $0.library == Library.reading.rawValue })  var readingBooks
    @ObservedResults(Book.self, where: { $0.library == Library.finished.rawValue }) var finishedBooks
}

extension HomeViewViewModel {
    func setStates(from tag: Int) {
        guard let library = Library.allCases.first(where: { $0.tag == tag}) else { return }
        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
            self.selectedLibrary = library
            self.selectedColor = library.color
        }
    }
    
    func setStates(from library: Library) {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
            selectedLibrary = library
            selectedColor = library.color
            selectedPage = library.tag
        }
    }
    
    func getRotationAngle(from index: Int) -> Double {
        var angle: Double = 0
        if index > 1 {
            angle = Double(-5 * index)
        }
        return angle
    }
    
    func getBooks(from library: Library) -> Results<Book> {
        var selectedBooks: Results<Book>
        switch library {
        case .toRead:
            selectedBooks = toReadBooks
        case .reading:
            selectedBooks = readingBooks
        case .finished:
            selectedBooks = finishedBooks
        }
        return selectedBooks
    }
}
