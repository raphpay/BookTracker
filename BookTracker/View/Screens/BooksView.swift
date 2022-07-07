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
    @ObservedRealmObject var group: BookGroup
    @Binding var selectedLibrary: Library
    @Binding var selectedIndex: Int
    @State var booksInLibrary: [Book] = []
    
    var body: some View {
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            if !booksInLibrary.isEmpty {
                TabView(selection: $selectedIndex) {
                    ForEach(0..<booksInLibrary.count, id: \.self) { index in
                        let book = booksInLibrary[index]
                        let imageLink = NetworkService.shared.getFirstNonNilImageURL(imageLinks: book.bookInfo?.imageLinks)
                        VStack {
                            KFImage(imageLink)
                                .tag(index)
                            
                            Text(book.bookInfo?.title ?? "Pas de titre")
                                .font(.title2.weight(.semibold))
                            
                            Button {
                                // TODO: Add actions
                            } label: {
                                // TODO: Style buttons
                                Text("Ajouter des pages")
                            }
                            
                            Button {
                                // TODO: Add actions
                            } label: {
                                // TODO: Style buttons
                                Text("Marqué comme terminé")
                            }

                            Spacer()
                        }
                        .padding(.top, 40)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
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
