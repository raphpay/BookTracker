//
//  PageCounterView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 16/06/2022.
//

import SwiftUI
import RealmSwift
import Kingfisher

struct PageCounterView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = PageCounterViewViewModel()
    @ObservedRealmObject var group: BookGroup
    @ObservedRealmObject var book: Book
    
    var body: some View {
        ZStack {
            Background()
            
            VStack {
                DismissButton { dismiss() }
                    .padding(.bottom)
                
                Text("\(String(format: "%.1f", viewModel.progress))% Completed")
                    .font(.title)
                    .bold()
                
                ProgressArcCircle(completionAmount: $viewModel.completionAmount)
                    .frame(width: 200, height: 200)
                
                
                HStack(spacing: 30) {
                    StepperButton(systemName: SFSymbols.minusCircle.rawValue) {
                        viewModel.decrementProgress()
                        $book.pagesRead.wrappedValue = Int(viewModel.pagesRead)
                    }

                    Text("Page \(Int(viewModel.pagesRead)) over \(Int(viewModel.totalPages))")
                        .font(.title2)
                        .bold()
                    
                    StepperButton(systemName: SFSymbols.plusCircle.rawValue) {
                        viewModel.incrementProgress()
                        $book.pagesRead.wrappedValue = Int(viewModel.pagesRead)
                    }
                }
                
                Spacer()
                
                HStack {
                    
                    BookInfos(title: viewModel.bookTitle, author: viewModel.bookFirstAuthor, category: viewModel.bookCategory)
                    
                    BookCover(imageLinks: viewModel.bookImageLinks)
                }
                
                Spacer()
            }
        }
        .onAppear {
            viewModel.setUp(with: book)
        }
    }
}

struct PageCounterView_Previews: PreviewProvider {
    static var previews: some View {
        PageCounterView(group: BookGroup(), book: Book())
    }
}

struct StepperButton: View {
    
    var systemName: String
    var action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .font(.title)
                .frame(width: 35, height: 35)
                .foregroundColor(.ui.darkBlueGray)
        }
    }
}

struct BookInfos: View {
    
    var title: String
    var author: String
    var category: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title)
                .bold()
                .padding()
            
            Text("by \(author)")
                .foregroundColor(.secondary)
            
            Text(category)
                .font(.title3)
        }
    }
}


// TODO: Use this component more widely across the app
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
