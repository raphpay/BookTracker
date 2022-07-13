//
//  BookCover.swift
//  BookTracker
//
//  Created by Raphaël Payet on 13/07/2022.
//

import SwiftUI
import Kingfisher

struct BookCover: View {
    var imageLinks: ImageLinks?
    
    var body: some View {
        ZStack {
            let link = NetworkService.shared.getFirstNonNilImageURL(imageLinks: imageLinks)
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
            
            KFImage(link)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .frame(width: 160, height: 220)
    }
}


struct BookCover_Previews: PreviewProvider {
    static var previews: some View {
        BookCover()
    }
}
