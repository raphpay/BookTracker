//
//  Conversion.swift
//  BookTracker
//
//  Created by Raphaël Payet on 04/07/2022.
//

import Foundation
import RealmSwift

class DataConversion {
    
    static let shared = DataConversion()
    
    func getBookFromDecobableObject(decodableBook: DecodableBookItem) -> Book {
        let book = Book()
        book.link = decodableBook.link
        let bookInfo = getBookInfoFromDecobableObject(decodableBookInfo: decodableBook.bookInfo)
        book.bookInfo = bookInfo
        return book
    }
}

extension DataConversion {
    private func getBookInfoFromDecobableObject(decodableBookInfo: DecodableBookInfo) -> BookInfo {
        let bookInfo = BookInfo()
        bookInfo.title = decodableBookInfo.title
        if let authors = decodableBookInfo.authors {
            for author in authors {
                bookInfo.authors.append(author)
            }
        }
        bookInfo.subtitle = decodableBookInfo.subtitle
        bookInfo.bookDescription = decodableBookInfo.description
        bookInfo.pageCount = decodableBookInfo.pageCount
        bookInfo.publishedDate = decodableBookInfo.publishedDate
        bookInfo.language = decodableBookInfo.language
        bookInfo.subtitle = decodableBookInfo.subtitle
        if let categories = decodableBookInfo.categories {
            for category in categories {
                bookInfo.categories.append(category)
            }
        }
        let imageLinks = getImageLinksFromDecobableObject(decodableImageLinks: decodableBookInfo.imageLinks)
        bookInfo.imageLinks = imageLinks
        if let decodableIndustryIdentifiers = decodableBookInfo.industryIdentifiers {
            let industryIdentifiers = getIndustryIdentifiersFromDecodableObject(decodableIndustryIdentifiers: decodableIndustryIdentifiers)
            bookInfo.industryIdentifiers = industryIdentifiers
        }
        return bookInfo
    }
    
    private func getImageLinksFromDecobableObject(decodableImageLinks: DecodableImageLinks?) -> ImageLinks? {
        let imageLinks = ImageLinks()
        guard let decodableImageLinks = decodableImageLinks else {
            return nil
        }
        imageLinks.smallThumbnail = decodableImageLinks.smallThumbnail
        imageLinks.thumbnail = decodableImageLinks.thumbnail
        imageLinks.small = decodableImageLinks.small
        imageLinks.medium = decodableImageLinks.medium
        imageLinks.large = decodableImageLinks.large
        imageLinks.extraLarge = decodableImageLinks.extraLarge
        return imageLinks
    }
    
    private func getIndustryIdentifiersFromDecodableObject(decodableIndustryIdentifiers: [DecodableIndustryIdentifiers]) -> List<IndustryIdentifiers> {
        let industryIdentifiers = List<IndustryIdentifiers>()
        for identifier in decodableIndustryIdentifiers {
            let realmIdentifier = IndustryIdentifiers()
            realmIdentifier.type = identifier.type
            realmIdentifier.identifier = identifier.identifier
            industryIdentifiers.append(realmIdentifier)
        }
        return industryIdentifiers
    }
}
