//
//  BooksView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 07/07/2022.
//

import SwiftUI
import RealmSwift

struct BooksView: View {
    
    @EnvironmentObject var appState: AppState
    @ObservedRealmObject var group: BookGroup
    @Binding var selectedLibrary: Library
    @Binding var selectedIndex: Int
    @State var booksInLibrary: [Book] = []
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            if !booksInLibrary.isEmpty {
                TabView(selection: $selectedIndex) {
                    ForEach(0..<booksInLibrary.count, id: \.self) { index in
                        let book = booksInLibrary[index]
                        Text(book.bookInfo?.title ?? "nil")
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
        }
        .onAppear {
            fetchBooks()
        }
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
    
    func fetchBooks() {
        for book in group.books {
            if book.library == selectedLibrary.rawValue {
                booksInLibrary.append(book)
            }
        }
        
        print(booksInLibrary)
    }
}

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView(group: BookGroup(), selectedLibrary: .constant(.reading), selectedIndex: .constant(0))
    }
}
