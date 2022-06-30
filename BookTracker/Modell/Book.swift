//
//  Book.swift
//  BookTracker
//
//  Created by Raphaël Payet on 27/06/2022.
//

import Foundation

struct BookMock: Identifiable {
    let id = UUID()
    let title: String
    let cover: String
    var category: ReadingCategory
}

var toReadBooks = [
    BookMock(title: "1984", cover: "Book-Cover", category: .toRead),
]

var readingBooks = [
    BookMock(title: "Hyper Focus", cover: "Book-Cover", category: .reading),
    BookMock(title: "Parapente", cover: "Book-Cover", category: .toRead),
]

var finishedBooks = [
    BookMock(title: "Labyrinthes", cover: "Book-Cover", category: .finished),
    BookMock(title: "Les amants du Mont-Blanc", cover: "Book-Cover", category: .finished),
]
