//
//  Book.swift
//  BookTracker
//
//  Created by Raphaël Payet on 27/06/2022.
//

import Foundation
import RealmSwift

final class BookGroup: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var books: List<Book>
}

final class Book: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var link: String
    @Persisted var bookInfo: BookInfo?
    @Persisted var library: String = Library.reading.rawValue
    
    var type: Library {
        get { return Library(rawValue: library)! }
        set { library = newValue.rawValue }
    }
}

final class BookInfo: Object, ObjectKeyIdentifiable {
    @Persisted var title: String
    @Persisted var authors = List<String>()
    @Persisted var subtitle: String?
    @Persisted var bookDescription: String?
    @Persisted var pageCount: Int?
    @Persisted var publishedDate: String?
    @Persisted var language: String?
    @Persisted var categories = List<String>()
    @Persisted var imageLinks: ImageLinks?
    @Persisted var industryIdentifiers = List<IndustryIdentifiers>()
}

final class ImageLinks: Object, ObjectKeyIdentifiable {
    @Persisted var smallThumbnail: String?
    @Persisted var thumbnail: String?
    @Persisted var small: String?
    @Persisted var medium: String?
    @Persisted var large: String?
    @Persisted var extraLarge: String?
}

final class IndustryIdentifiers: Object, ObjectKeyIdentifiable {
    @Persisted var type: String?
    @Persisted var identifier: String?
}

