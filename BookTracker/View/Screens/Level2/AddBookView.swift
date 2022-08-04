//
//  AddBookView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 27/06/2022.
//

import SwiftUI
import RealmSwift

struct AddBookView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = AddBookViewViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                Picker("Choose a book category", selection: $viewModel.selectedLibrary) {
                    ForEach(Library.allCases, id: \.self) { library in
                        Text(library.name)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                HStack {
                    ForEach(SearchCategory.allCases) { category in
                        let isSelected = viewModel.selectedIDs.contains(where: { $0 == category.tag })
                        
                        Button {
                            withAnimation {
                                if isSelected {
                                    guard let index = viewModel.selectedIDs.firstIndex(of: category.tag) else { return }
                                    viewModel.selectedIDs.remove(at: index)
                                } else {
                                    viewModel.selectedIDs.append(category.tag)
                                }
                            }
                        } label: {
                            Text(category.title)
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .background(isSelected ? category.color : .gray.opacity(0.2), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                                .foregroundColor(isSelected ? .white : .primary)
                        }
                    }
                }
                .padding(.horizontal)
                
                if viewModel.selectedIDs.contains(where: { $0 == SearchCategory.title.tag }) {
                    TextField(SearchCategory.title.placeholder, text: $viewModel.titleText, onEditingChanged: { _ in
                        viewModel.animateShowButton()
                    }, onCommit: {
                        viewModel.searchBook()
                    })
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                
                if viewModel.selectedIDs.contains(where: { $0 == SearchCategory.author.tag }) {
                    TextField(SearchCategory.author.placeholder, text: $viewModel.authorText, onEditingChanged: { _ in
                        viewModel.animateShowButton()
                    }, onCommit: {
                        viewModel.searchBook()
                    })
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                
                
                if viewModel.selectedIDs.contains(where: { $0 == SearchCategory.paperPublisher.tag }) {
                    TextField(SearchCategory.paperPublisher.placeholder, text: $viewModel.publisherText, onEditingChanged: { _ in
                        viewModel.animateShowButton()
                    }, onCommit: {
                        viewModel.searchBook()
                    })
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                
                
                if viewModel.selectedIDs.contains(where: { $0 == SearchCategory.isbn.tag }) {
                    TextField(SearchCategory.isbn.placeholder, text: $viewModel.ISBNText, onEditingChanged: { _ in
                        viewModel.animateShowButton()
                    }, onCommit: {
                        viewModel.searchBook()
                    })
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .padding()
                }
                
                RoundedButton(title: "Search book", showButton: $viewModel.showSearchButton) {
                    viewModel.searchBook()
                }.padding(.top)
                
                VStack {
                    ForEach(viewModel.foundBooks) { bookItem in
                        DecodableBookCell(
                            viewModel: DecodableBookCellViewModel(
                                decodableBookItem: bookItem,
                                library: viewModel.selectedLibrary))
                    }
                }
                .padding()
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .overlay(
            VStack {
                DismissButton { dismiss() }
                Spacer()
            }
                .padding(.top, 30)
                .ignoresSafeArea()
    )
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
