//
//  BookCategoryButton.swift
//  BookTracker
//
//  Created by Raphaël Payet on 17/06/2022.
//

import SwiftUI

struct BookCategoryButton: View {
    
    let title: String
    let tag: Int
    let width: CGFloat
    @Binding var selectedTag: Int
    var action: (() -> Void)
    
    var body: some View {
        Text(title)
            .font(.title2)
            .foregroundColor(selectedTag == tag ? .primary : .secondary)
            .fontWeight(selectedTag == tag ? .bold : .regular)
            .onTapGesture {
                action()
            }
    }
}


struct BookCategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        BookCategoryButton(title: "Reading", tag: 1, width: 400, selectedTag: .constant(1)) {}
    }
}
