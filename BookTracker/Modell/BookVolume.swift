//
//  BookVolume.swift
//  BookTracker
//
//  Created by Raphaël Payet on 28/06/2022.
//

import Foundation

// TODO: Rename this file and remove the BookCategory
struct BookVolume: Decodable {
    let books: [BookItem]
    let items: Int
    
    enum CodingKeys: String, CodingKey {
        case books = "items"
        case items = "totalItems"
    }
}

struct BookItem: Decodable, Identifiable {
    let id: String
    let link: String
    let bookInfo: BookInfo
    
    enum CodingKeys: String, CodingKey {
        case id
        case link = "selfLink"
        case bookInfo = "volumeInfo"
    }
}

struct BookInfo: Decodable {
    let title: String
    let authors: [String]?
    let subtitle: String?
    let description: String?
    let pageCount: Int?
    let publishedDate: String?
    let language: String?
    let categories: [String]?
    let imageLinks: ImageLinks?
    let industryIdentifiers: [IndustryIdentifiers]?
}

let bookItemMock = BookItem(id: UUID().uuidString, link: "link\(UUID().uuidString)",
                            bookInfo: BookInfo(title: "Hyperfocus", authors: ["Chris Bailey"], subtitle: "", description: "", pageCount: 200, publishedDate: "207", language: "en", categories: [], imageLinks: nil, industryIdentifiers: nil))

struct ImageLinks: Decodable {
    let smallThumbnail: String?
    let thumbnail: String?
    let small: String?
    let medium: String?
    let large: String?
    let extraLarge: String?
}

struct IndustryIdentifiers: Decodable, Hashable {
    let type: String
    let identifier: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(type)
    }
}
