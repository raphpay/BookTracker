//
//  BookCell2.swift
//  BookTracker
//
//  Created by Raphaël Payet on 04/08/2022.
//

import SwiftUI
import RealmSwift

struct RealmBookCell: View {
    
    var book: Book? = nil
    let library: Library
    var openAction: (() -> Void)? = nil
    var firstAuthor: String? {
        if let realmBookAuthors = book?.bookInfo?.authors {
            return realmBookAuthors[0]
        } else { return nil }
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                HStack {
                    Text(book?.bookInfo?.title ?? "")
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
            Divider()
        }
        .padding(.bottom)
    }
}

struct BookCell2_Previews: PreviewProvider {
    static var previews: some View {
        RealmBookCell(library: .reading)
    }
}
