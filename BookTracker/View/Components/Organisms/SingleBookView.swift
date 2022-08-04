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
            
            if selectedLibrary != .finished {
                Button {
                    // TODO: Add actions
                } label: {
                    // TODO: Style buttons
                    Text("Marqué comme terminé")
                }
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
