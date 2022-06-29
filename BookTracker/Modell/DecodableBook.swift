//
//  DecodableBook.swift
//  BookTracker
//
//  Created by Raphaël Payet on 28/06/2022.
//

import Foundation

// TODO: Rename this file and remove the BookCategory
struct DecodableBookVolume: Decodable {
    let kind: String
    let totalItems: Int
    let books: [DecodableBook]
    
    enum CodingKeys: String, CodingKey {
        case kind
        case totalItems
        case books = "items"
    }
}

struct DecodableBook: Decodable {
    let id: String
    let link: String
    let volumeInfo: VolumeInfo
    
    enum CodingKeys: String, CodingKey {
        case id
        case link = "selfLink"
        case volumeInfo
    }
}

struct VolumeInfo: Decodable {
    let title: String
    let subtitle: String?
    let authors: [String]?
    let publishedDate: String?
    let pageCount: Int?
    let language: String?
    let description: String?
    let categories: [String]?
    let imageLinks: ImageLinks?
}

struct ImageLinks: Decodable {
    let smallThumbnail: String?
    let thumbnail: String?
    let small: String?
    let medium: String?
    let large: String?
    let extraLarge: String?
}
