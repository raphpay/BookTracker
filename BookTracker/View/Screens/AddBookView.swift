//
//  AddBookView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 27/06/2022.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var bookTitle: String = ""
    @State var selectedBookCategory: BookCategory.BookCategoryType = .toRead
    
    var body: some View {
        Form {
            Section {
                TextField("Book title", text: $bookTitle)
                Picker("Please choose a category", selection: $selectedBookCategory) {
                    ForEach(bookCategoryTypes, id: \.self) {
                        Text($0.name)
                    }
                }
                .pickerStyle(.menu)
                Button {
                    //
                } label: {
                    Text("Add book")
                }

            }
        }
        .safeAreaInset(edge: .top, content: {
            Color.clear
                .frame(height: 50)
        })
        .overlay(
            VStack {
                DismissButton { dismiss() }
                Spacer()
            }
                .frame(maxHeight: .infinity)
                .padding(.top)
                .ignoresSafeArea()
        )
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
