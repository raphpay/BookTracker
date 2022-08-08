//
//  AddBookViewViewModel.swift
//  BookTracker
//
//  Created by Raphaël Payet on 03/07/2022.
//

import SwiftUI

class AddBookViewViewModel: ObservableObject {
    @Published var selectedIDs: [Int]       = [0]
    @Published var titleText: String        = ""
    @Published var authorText: String       = ""
    @Published var publisherText: String    = ""
    @Published var ISBNText: String         = ""
    @Published var showSearchButton: Bool   = false
    @Published var foundBooks: [DecodableBookItem]   = []
    @Published var selectedLibrary: Library = .reading
}

extension AddBookViewViewModel {
    func animateShowButton() {
        withAnimation {
            // TODO: Animation to revisit
            showSearchButton = true
        }
    }
    
    func searchBook() {
        var query = ""
        var showTitleQuery = false
        var showAuthorQuery = false
        var showPublisherQuery = false
        
        if !titleText.isEmpty {
            query += "\(titleText.prepareForQueries())"
            showTitleQuery = true
        }
        if !authorText.isEmpty {
            if showTitleQuery {
                query += "+inauthor:\(authorText.prepareForQueries())"
            } else {
                query += "inauthor:\(authorText.prepareForQueries())"
            }
            showAuthorQuery = true
        }
        if !publisherText.isEmpty {
            if showTitleQuery || showAuthorQuery {
                query += "+inpublisher:\(publisherText.prepareForQueries())"
            } else {
                query += "inpublisher:\(publisherText.prepareForQueries())"
            }
            showPublisherQuery = true
        }
        if !ISBNText.isEmpty {
            if showTitleQuery || showAuthorQuery || showPublisherQuery {
                query += "+isbn:\(ISBNText.prepareForQueries())"
            } else {
                query += "isbn:\(ISBNText.prepareForQueries())"
            }
        }
        
        NetworkRequestService.shared.session.fetchBooks(with: query) { result in
            switch result {
            case .success(let books):
                withAnimation {
                    self.foundBooks = books
                }
                break;
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func createRealmBook(from bookItem: DecodableBookItem) -> Book {
        let realmBook = DataConversion.shared.getBookFromDecobableObject(decodableBook: bookItem)
        realmBook.library = selectedLibrary.rawValue
        return realmBook
    }
}
