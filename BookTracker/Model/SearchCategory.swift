//
//  SearchCategory.swift
//  BookTracker
//
//  Created by Raphaël Payet on 03/07/2022.
//

import SwiftUI

struct SearchCategory: Identifiable {
    let id = UUID()
    let title: String
    let tag: Int
    let color: Color
}

let searchCategories = [
    SearchCategory(title: "Title", tag: 0, color: .green),
    SearchCategory(title: "Author", tag: 1, color: .red),
    SearchCategory(title: "Publisher", tag: 2, color: .blue),
    SearchCategory(title: "ISBN", tag: 3, color: .purple),
]
