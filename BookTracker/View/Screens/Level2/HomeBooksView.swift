//
//  HomeBooksView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 04/08/2022.
//

import SwiftUI
import RealmSwift
import Kingfisher

struct HomeBooksView: View {
    
    var library: Library
    var books: Results<Book>?
    @Binding var showDetails: Bool
    @Binding var selectedLibrary: Library
    @Binding var selectedIndex: Int
    
    var body: some View {
        
        if let books = books {
            VStack {
                ZStack {
                    ForEach(0..<min(books.count, 4), id: \.self) { index in
                        let book = books[index]
                        if let imageURL = NetworkService.shared.getFirstNonNilImageURL(imageLinks: book.bookInfo?.imageLinks) {
                            KFImage(imageURL)
                                .resizable()
                                .frame(width: 180, height: 250)
                                .rotationEffect(.degrees(getRotationAngle(from: index)))
                                .zIndex(Double(-index))
                        }
                        
                    }
                }
                
                if books.isEmpty {
                    Text("No books in this library.\nAdd one with the '+' button.")
                } else {
                    VStack() {
                        Text("Books in the library :")
                            .font(.title.weight(.semibold))
                        
                        ForEach(0..<books.count, id: \.self) { index in
                            let book = books[index]
                            
                            // TODO: RPA - Create a book cell for non-realm object
                            RealmBookCell(book: book, library: library) {
                                withAnimation {
                                    showDetails = true
                                    selectedLibrary = library
                                    selectedIndex = index
                                }
                            }
                            
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                }
                
                Spacer()
            }.padding()
            
        }
    }
    
    func getRotationAngle(from index: Int) -> Double {
        var angle: Double = 0
        if index > 1 {
            angle = Double(-5 * index)
        }
        return angle
    }
}

struct HomeBooksView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBooksView(library: Library.finished, showDetails: .constant(false), selectedLibrary: .constant(.reading), selectedIndex: .constant(1))
    }
}
