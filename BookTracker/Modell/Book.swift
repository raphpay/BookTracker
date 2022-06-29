//
//  Book.swift
//  BookTracker
//
//  Created by Raphaël Payet on 27/06/2022.
//

import Foundation

struct Book: Identifiable {
    let id = UUID()
    let title: String
    let cover: String
    var category: ReadingCategory
}

var toReadBooks = [
    Book(title: "1984", cover: "Book-Cover", category: .toRead),
]

var readingBooks = [
    Book(title: "Hyper Focus", cover: "Book-Cover", category: .reading),
    Book(title: "Parapente", cover: "Book-Cover", category: .toRead),
]

var finishedBooks = [
    Book(title: "Labyrinthes", cover: "Book-Cover", category: .finished),
    Book(title: "Les amants du Mont-Blanc", cover: "Book-Cover", category: .finished),
]
