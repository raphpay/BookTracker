//
//  DecodableBookCell.swift
//  BookTracker
//
//  Created by Raphaël Payet on 06/07/2022.
//

import SwiftUI
import RealmSwift

struct DecodableBookCell: View {
    
    @StateObject var viewModel: DecodableBookCellViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if let item = viewModel.decodableBookItem {
                    HStack {
                        Text(item.bookInfo.title)
                        if viewModel.firstAuthor != nil {
                            Text("-")
                                .foregroundStyle(.secondary)
                            Text(viewModel.firstAuthor ?? "")
                                .foregroundStyle(.secondary)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Button {
                        viewModel.saveBook(item)
                    } label: {
                        Image(systemName: "plus")
                    }
                    NavigationLink(destination: BookInfoView(bookItem: item)) {
                        Image(systemName: "info")
                    }
                }
            }
            Divider()
        }
        .padding(.bottom)
    }
}

struct DecodableBookCell_Previews: PreviewProvider {
    static var previews: some View {
        DecodableBookCell(viewModel: DecodableBookCellViewModel(library: .finished))
    }
}
