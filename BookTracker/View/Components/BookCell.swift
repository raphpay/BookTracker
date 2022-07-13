//
//  BookCell.swift
//  BookTracker
//
//  Created by Raphaël Payet on 06/07/2022.
//

import SwiftUI
import RealmSwift

struct BookCell: View {
    
    @ObservedRealmObject var group: BookGroup
    var decodableBookItem: DecodableBookItem? = nil
    var book: Book? = nil
    let library: Library
    var openAction: (() -> Void)? = nil
    var firstAuthor: String? {
        if let itemAuthors = decodableBookItem?.bookInfo.authors {
            return itemAuthors[0]
        } else if let realmBookAuthors = book?.bookInfo?.authors {
            return realmBookAuthors[0]
        } else { return nil }
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if let item = decodableBookItem {
                    HStack {
                        Text(item.bookInfo.title)
                        if firstAuthor != nil {
                            Text("-")
                                .foregroundStyle(.secondary)
                            Text(firstAuthor ?? "")
                                .foregroundStyle(.secondary)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Button {
                        let realmBook = DataConversion.shared.getBookFromDecobableObject(decodableBook: item)
                        realmBook.library = library.rawValue
                        if library == .finished,
                           let pageCount = realmBook.bookInfo?.pageCount {
                            realmBook.pagesRead = pageCount
                        }
                        $group.books.append(realmBook)
                    } label: {
                        Image(systemName: "plus")
                    }
                    NavigationLink(destination: BookInfoView(bookItem: item)) {
                        Image(systemName: "info")
                    }
                } else if let bookItem = book {
                    HStack {
                        Text(bookItem.bookInfo?.title ?? "")
                        if firstAuthor != nil {
                            Text("-")
                                .foregroundStyle(.secondary)
                            Text(firstAuthor ?? "")
                                .foregroundStyle(.secondary)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Button {
                        openAction?()
                    } label: {
                        Image(systemName: "info")
                    }
                }
            }
            Divider()
        }
        .padding(.bottom)
    }
}

struct BookCell_Previews: PreviewProvider {
    static var previews: some View {
        BookCell(group: BookGroup(), library: .reading)
    }
}
