//
//  BookInfoView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 01/07/2022.
//

import Foundation

//
//  RoundedButton.swift
//  BookTracker
//
//  Created by Raphaël Payet on 29/06/2022.
//

import SwiftUI

struct BookInfoView: View {
    
    var bookItem: DecodableBookItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(bookItem.bookInfo.title)
                .font(.title.weight(.semibold))
            Text(bookItem.bookInfo.subtitle ?? "")
                .font(.title2)
            VStack {
                ForEach(bookItem.bookInfo.authors ?? [], id: \.self) { author in
                    Text(author)
                }
            }
            VStack {
                ForEach(bookItem.bookInfo.industryIdentifiers ?? [], id: \.self) { industryIdentifier in
                    HStack {
                        Text(industryIdentifier.type)
                        Text(" = ")
                        Text(industryIdentifier.identifier)
                    }
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.top)
        .padding(.horizontal)
    }
}

struct BookInfoView_Previews: PreviewProvider {
    static var previews: some View {
        BookInfoView(bookItem: bookItemMock)
    }
}
