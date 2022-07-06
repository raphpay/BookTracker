//
//  DecodableBook.swift
//  BookTracker
//
//  Created by Raphaël Payet on 28/06/2022.
//

import Foundation

struct DecodableBookVolume: Decodable {
    let books: [DecodableBookItem]
    let items: Int
    
    enum CodingKeys: String, CodingKey {
        case books = "items"
        case items = "totalItems"
    }
}

struct DecodableBookItem: Decodable, Identifiable {
    let id: String
    let link: String
    let bookInfo: DecodableBookInfo
    
    enum CodingKeys: String, CodingKey {
        case id
        case link = "selfLink"
        case bookInfo = "volumeInfo"
    }
}

struct DecodableBookInfo: Decodable {
    let title: String
    let authors: [String]?
    let subtitle: String?
    let description: String?
    let pageCount: Int?
    let publishedDate: String?
    let language: String?
    let categories: [String]?
    let imageLinks: DecodableImageLinks?
    let industryIdentifiers: [DecodableIndustryIdentifiers]?
}

struct DecodableImageLinks: Decodable {
    let smallThumbnail: String?
    let thumbnail: String?
    let small: String?
    let medium: String?
    let large: String?
    let extraLarge: String?
}

struct DecodableIndustryIdentifiers: Decodable, Hashable {
    let type: String
    let identifier: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(type)
    }
}

let mockImageLink = DecodableImageLinks(smallThumbnail: nil, thumbnail: nil, small: nil, medium: nil,
                                        large: "http://books.google.com/books/content?id=seTB7nOSn0IC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                                        extraLarge: nil)

let bookItemMock = DecodableBookItem(id: UUID().uuidString, link: "link\(UUID().uuidString)",
                            bookInfo: DecodableBookInfo(title: "Hyperfocus", authors: ["Chris Bailey"], subtitle: "", description: "", pageCount: 200, publishedDate: "207", language: "en",
                                                        categories: [],
                                                        imageLinks: mockImageLink,
                                                        industryIdentifiers: nil))
