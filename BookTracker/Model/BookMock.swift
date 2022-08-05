//
//  BookMock.swift
//  BookTracker
//
//  Created by Raphaël Payet on 04/08/2022.
//

import Foundation
import RealmSwift

enum BookMock {
    static var hyperFocus: Book {
        let book = Book()
        book.library = Library.finished.rawValue
        book.bookInfo?.title = "Hyperfocus"
        let authorsList = List<String>()
        authorsList.append("Chris Bailey")
        book.bookInfo?.authors = authorsList
        return book
    }
    
    static var nouvelles: Book {
        let book = Book()
        book.library = Library.reading.rawValue
        book.bookInfo?.title = "Nouvelles"
        let authorsList = List<String>()
        authorsList.append("Frank Thilliez")
        book.bookInfo?.authors = authorsList
        return book
    }
    
    static var orwell: Book {
        let book = Book()
        book.library = Library.reading.rawValue
        book.bookInfo?.title = "1984"
        let authorsList = List<String>()
        authorsList.append("George Orwell")
        book.bookInfo?.authors = authorsList
        return book
    }
}
