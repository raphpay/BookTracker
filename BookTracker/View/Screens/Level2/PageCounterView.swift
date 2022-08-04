//
//  PageCounterView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 16/06/2022.
//

import SwiftUI
import RealmSwift

struct PageCounterView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = PageCounterViewViewModel()
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
                    bookInfos
                    BookCover(imageLinks: viewModel.bookImageLinks)
                }
                
                Spacer()
            }
        }
        .onAppear {
            viewModel.setUp(with: book)
        }
    }
    
    var bookInfos: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(viewModel.bookTitle)
                .font(.title)
                .bold()
                .padding()
            
            Text("by \(viewModel.bookFirstAuthor)")
                .foregroundColor(.secondary)
            
            Text(viewModel.bookCategory)
                .font(.title3)
        }
    }
}

struct PageCounterView_Previews: PreviewProvider {
    static var previews: some View {
        PageCounterView(book: BookMock.nouvelles)
    }
}
