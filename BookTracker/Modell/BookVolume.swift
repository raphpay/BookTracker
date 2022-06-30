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
    
    enum CodingKeys: String, CodingKey {
        case books = "items"
    }
}

struct BookItem: Decodable {
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

struct ImageLinks: Decodable {
    let smallThumbnail: String?
    let thumbnail: String?
    let small: String?
    let medium: String?
    let large: String?
    let extraLarge: String?
}

struct IndustryIdentifiers: Decodable {
    let type: String
    let identifier: String
}
