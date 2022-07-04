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
    @ObservedRealmObject var group: BookGroup
    
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
                    ForEach(searchCategories) { category in
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
                
                if viewModel.selectedIDs.contains(where: { $0 == 0 }) {
                    TextField("Search by title", text: $viewModel.titleText, onEditingChanged: { _ in
                        viewModel.animateShowButton()
                    }, onCommit: {
                        //
                    })
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                
                if viewModel.selectedIDs.contains(where: { $0 == 1 }) {
                    TextField("Search by author", text: $viewModel.authorText, onEditingChanged: { _ in
                        viewModel.animateShowButton()
                    }, onCommit: {
                        //
                    })
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                
                
                if viewModel.selectedIDs.contains(where: { $0 == 2 }) {
                    TextField("Search by publisher", text: $viewModel.publisherText, onEditingChanged: { _ in
                        viewModel.animateShowButton()
                    }, onCommit: {
                        //
                    })
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                
                
                if viewModel.selectedIDs.contains(where: { $0 == 3 }) {
                    TextField("Search by ISBN", text: $viewModel.ISBNText, onEditingChanged: { _ in
                        viewModel.animateShowButton()
                    }, onCommit: {
                        //
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
                        let firstAuthor = bookItem.bookInfo.authors?[0]
                        
                        VStack(alignment: .leading) {
                            HStack {
                                HStack {
                                    Text(bookItem.bookInfo.title)
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
                                    let realmBook = DataConversion.shared.getBookFromDecobableObject(decodableBook: bookItem)
                                    $group.books.append(realmBook)
                                } label: {
                                    Image(systemName: "plus")
                                }
                                NavigationLink(destination: BookInfoView(bookItem: bookItem)) {
                                    Image(systemName: "info")
                                }
                            }
                            Divider()
                        }
                        .padding(.bottom)
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
        AddBookView(group: BookGroup())
    }
}
