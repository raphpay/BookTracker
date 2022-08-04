//
//  DecodableBookCellViewModel.swift
//  BookTracker
//
//  Created by Raphaël Payet on 04/08/2022.
//

import Foundation

import SwiftUI
import RealmSwift

class DecodableBookCellViewModel: ObservableObject {
    @ObservedResults(Book.self) var books
    var decodableBookItem: DecodableBookItem?
    let library: Library
    var firstAuthor: String?
    
    init(decodableBookItem: DecodableBookItem? = nil, library: Library) {
        self.decodableBookItem = decodableBookItem
        self.library = library
        if let itemAuthors = decodableBookItem?.bookInfo.authors {
            self.firstAuthor = itemAuthors[0]
        } else { self.firstAuthor = nil }
    }
}

extension DecodableBookCellViewModel {
    func saveBook(_ item: DecodableBookItem) {
        let realmBook = DataConversion.shared.getBookFromDecobableObject(decodableBook: item)
        realmBook.library = library.rawValue
        if library == .finished,
           let pageCount = realmBook.bookInfo?.pageCount {
            realmBook.pagesRead = pageCount
        }
        $books.append(realmBook)
    }
}
