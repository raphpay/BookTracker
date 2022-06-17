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
    
    var offset: CGFloat {
        switch selectedTag {
        case 0:
            return width / 3 + 16
        case 1:
            return 0
        case 2:
            return -width / 3 - 16
        default:
            return 0;
        }
    }
    
    var body: some View {
        Button {
            withAnimation {
                selectedTag = tag
            }
        } label: {
            Text(title)
                .font(.title2)
                .foregroundColor(selectedTag == tag ? .primary : .secondary)
                .fontWeight(selectedTag == tag ? .bold : .regular)
        }
        .offset(x: offset)
        .animation(.spring(), value: offset)
    }
}


struct BookCategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        BookCategoryButton(title: "Reading", tag: 1, width: 400, selectedTag: .constant(1))
    }
}
