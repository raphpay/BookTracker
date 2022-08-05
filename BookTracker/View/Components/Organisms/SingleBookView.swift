//
//  SingleBookView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 04/08/2022.
//

import SwiftUI
import RealmSwift

struct SingleBookView: View {
    
    @ObservedRealmObject var book: Book
    @Binding var selectedLibrary: Library
    @Binding var selectedBook: Book
    @Binding var showAddPagesModal: Bool
    
    var body: some View {
        VStack {
            BookCover(imageLinks: book.bookInfo?.imageLinks)
            
            Text(book.bookInfo?.title ?? "Pas de titre")
                .font(.title2.weight(.semibold))
            
            Button {
                showAddPagesModal = true
                selectedBook = book
            } label: {
                // TODO: Style buttons
                Text("Ajouter des pages")
            }
            
            VStack {
                Text("Actual category")
                
                HStack {
                    Text("To read")
                    Spacer()
                    Button {
                        selectedLibrary = .toRead
                        $book.library.wrappedValue = Library.toRead.rawValue
                    } label: {
                        Image(systemName: selectedLibrary == .toRead ? "circle.fill" : "circle")
                    }

                }
                .padding(.horizontal)
                
                HStack {
                    Text("Reading")
                    Spacer()
                    Button {
                        selectedLibrary = .reading
                        $book.library.wrappedValue = Library.reading.rawValue
                    } label: {
                        Image(systemName: selectedLibrary == .reading ? "circle.fill" : "circle")
                    }

                }
                .padding(.horizontal)
                
                HStack {
                    Text("Finished")
                    Spacer()
                    Button {
                        selectedLibrary = .finished
                        $book.library.wrappedValue = Library.finished.rawValue
                    } label: {
                        Image(systemName: selectedLibrary == .finished ? "circle.fill" : "circle")
                    }

                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .tag(book._id)
        .padding(.top, 40)
    }
}


struct SingleBookView_Previews: PreviewProvider {
    static var previews: some View {
        SingleBookView(book: BookMock.nouvelles, selectedLibrary: .constant(.finished), selectedBook: .constant(BookMock.nouvelles),
                       showAddPagesModal: .constant(false))
    }
}
