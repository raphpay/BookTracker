//
//  PageCounterViewViewModel.swift
//  BookTracker
//
//  Created by Raphaël Payet on 17/06/2022.
//

import Foundation
import SwiftUI

class PageCounterViewViewModel: ObservableObject {
    @Published var completionAmount: Float = 0.0
    @Published var pagesRead: Float = 0
    @Published var progress: Float = 0
    @Published var totalPages: Float = 0
    @Published var bookTitle: String = ""
    // TODO: Adapt the view to have an array of author
    @Published var bookFirstAuthor: String = ""
    @Published var bookCategory: String = ""
    @Published var bookImageLinks: ImageLinks?
    let maximumCompletionAmount: Float = 0.5
}

extension PageCounterViewViewModel {
    func setUp(with book: Book?) {
        guard let book = book,
              let bookInfo = book.bookInfo else { return }
        self.pagesRead = Float(book.pagesRead)
        self.totalPages = Float(bookInfo.pageCount ?? 0)
        self.bookTitle = bookInfo.title
        if !bookInfo.authors.isEmpty {
            self.bookFirstAuthor = bookInfo.authors[0]
        }
        if !bookInfo.categories.isEmpty {
            self.bookCategory = bookInfo.categories[0]
        }
        self.bookImageLinks = bookInfo.imageLinks
        calculateProgress()
    }
}

extension PageCounterViewViewModel {
    func incrementProgress() {
        if (pagesRead < totalPages) {
            pagesRead += 1
            calculateProgress()
        }
    }
    
    func decrementProgress() {
        if (pagesRead > 0) {
            pagesRead -= 1
            calculateProgress()
        }
    }
    
    func calculateProgress() {
        let percentage = pagesRead/totalPages * 100
        progress = round(percentage * 10) / 10.0
        withAnimation {
            completionAmount = maximumCompletionAmount * pagesRead / totalPages
        }
    }
}
