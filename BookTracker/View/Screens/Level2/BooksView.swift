//
//  BooksView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 07/07/2022.
//

import SwiftUI
import RealmSwift
import Kingfisher

struct BooksView: View {
    
    @EnvironmentObject var appState: AppState
    @Binding var selectedLibrary: Library
    @Binding var selectedIndex: Int
    @State var books: Results<Book>?
    @State var showAddPagesModal: Bool = false
    @State var selectedBook: Book = Book()
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()

            if let books = books,
                !books.isEmpty {
                TabView(selection: $selectedIndex) {
                    ForEach(0..<books.count, id: \.self) { index in
                        let book = books[index]
                        SingleBookView(book: book,
                                       selectedLibrary: $selectedLibrary,
                                       selectedBook: $selectedBook,
                                       showAddPagesModal: $showAddPagesModal)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
            }
        }
        .sheet(isPresented: $showAddPagesModal, content: {
            PageCounterView(book: selectedBook)
        })
        .overlay(
            DismissButton {
                withAnimation {
                    appState.showDetails = false
                }
            }
                .frame(maxWidth: .infinity, alignment: .topTrailing)
                .frame(maxHeight: .infinity, alignment: .topTrailing)
        )
    }
}

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView(selectedLibrary: .constant(.reading), selectedIndex: .constant(0))
    }
}
