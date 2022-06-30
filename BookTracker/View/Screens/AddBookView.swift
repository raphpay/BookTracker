//
//  AddBookView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 27/06/2022.
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

struct AddBookView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var selectedIDs: [Int]       = [0]
    @State var titleText: String        = ""
    @State var authorText: String       = ""
    @State var publisherText: String    = ""
    @State var ISBNText: String         = ""
    @State var showSearchButton: Bool   = false
    
    var body: some View {
        VStack {
            HStack {
                ForEach(searchCategories) { category in
                    let isSelected = selectedIDs.contains(where: { $0 == category.tag })
                    
                    Button {
                        withAnimation {
                            if isSelected {
                                guard let index = selectedIDs.firstIndex(of: category.tag) else { return }
                                selectedIDs.remove(at: index)
                            } else {
                                selectedIDs.append(category.tag)
                            }
                        }
                    } label: {
                        Text(category.title)
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(isSelected ? category.color : .gray.opacity(0.2), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .foregroundColor(isSelected ? .white : .primary)
                    }
                }
            }
            .padding(.horizontal)
            
            if selectedIDs.contains(where: { $0 == 0 }) {
                TextField("Search by title", text: $titleText, onEditingChanged: { _ in
                    animateShowButton()
                }, onCommit: {
                    //
                })
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            
            if selectedIDs.contains(where: { $0 == 1 }) {
                TextField("Search by author", text: $authorText, onEditingChanged: { _ in
                    animateShowButton()
                }, onCommit: {
                    //
                })
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            
            
            if selectedIDs.contains(where: { $0 == 2 }) {
                TextField("Search by publisher", text: $publisherText, onEditingChanged: { _ in
                    animateShowButton()
                }, onCommit: {
                    //
                })
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            
            
            if selectedIDs.contains(where: { $0 == 3 }) {
                TextField("Search by ISBN", text: $ISBNText, onEditingChanged: { _ in
                    animateShowButton()
                }, onCommit: {
                    //
                })
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                    .padding()
            }
            
            RoundedButton(title: "Search book", showButton: $showSearchButton) {
                searchBook()
            }.padding(.top)
            
            Spacer()
        }
        .padding(.top, 65)
        .overlay(
            VStack {
                DismissButton { dismiss() }
                Spacer()
            }
                .padding(.top, 30)
                .ignoresSafeArea()
        )
    }
    
    func animateShowButton() {
        withAnimation {
            // TODO: Animation to revisit
            showSearchButton = true
        }
    }
    
    func searchBook() {
        var query = ""
        var showTitleQuery = false
        var showAuthorQuery = false
        var showPublisherQuery = false
        
        if !titleText.isEmpty {
            query += "\(titleText.prepareForQueries())"
            showTitleQuery = true
        }
        if !authorText.isEmpty {
            if showTitleQuery {
                query += "+inauthor:\(authorText.prepareForQueries())"
            } else {
                query += "inauthor:\(authorText.prepareForQueries())"
            }
            showAuthorQuery = true
        }
        if !publisherText.isEmpty {
            if showTitleQuery || showAuthorQuery {
                query += "+inpublisher:\(publisherText.prepareForQueries())"
            } else {
                query += "inpublisher:\(publisherText.prepareForQueries())"
            }
            showPublisherQuery = true
        }
        if !ISBNText.isEmpty {
            if showTitleQuery || showAuthorQuery || showPublisherQuery {
                query += "+isbn:\(ISBNText.prepareForQueries())"
            } else {
                query += "isbn:\(ISBNText.prepareForQueries())"
            }
        }
        
        NetworkService.shared.fetchBooks(with: query)
    }
    
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
