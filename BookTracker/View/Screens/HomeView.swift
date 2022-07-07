//
//  HomeView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 17/06/2022.
//

import SwiftUI
import RealmSwift
import Kingfisher

struct HomeView: View {
    
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel = HomeViewViewModel()
    @ObservedRealmObject var group: BookGroup
    
    var body: some View {
        ZStack {
            VStack {
                statusBar
                
                textTabBar
                
                paginationTab
            }
            
            if appState.showDetails {
                BooksView(group: group, selectedLibrary: $viewModel.selectedLibrary, selectedIndex: $viewModel.selectedIndex)
            }
        }
        .fullScreenCover(isPresented: $viewModel.showAddBookSheet) {
            AddBookView(group: group)
        }
    }
    
    var statusBar: some View {
        HStack {
            Text("Book Tracker")
                .font(.title.weight(.semibold))
            Spacer()
            Button {
                viewModel.showAddBookSheet.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.title2.weight(.semibold))
            }
            .foregroundStyle(.primary)

        }
        .padding(.horizontal)
    }
    
    var textTabBar: some View {
        HStack {
            ForEach(Library.allCases, id: \.self) { library in
                Button {
                    viewModel.setStates(from: library)
                } label: {
                    Text(library.name)
                        .font(.title2.weight(.semibold))
                }
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .foregroundStyle(viewModel.selectedLibrary == library ? .primary : .secondary)
                .blendMode(viewModel.selectedLibrary == library ? .overlay : .normal)
                .overlay(tabGeometryReader)
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
        .background(rectangleBackground)
    }
    
    var paginationTab: some View {
        TabView(selection: $viewModel.selectedPage) {
            ForEach(Library.allCases, id: \.self) { library in
                let booksInLibrary = group.books.where({ $0.library == library.rawValue })
                VStack {
                    ZStack {
                        ForEach(0..<min(booksInLibrary.count, 4), id: \.self) { index in
                            let book = booksInLibrary[index]
                            if let imageURL = NetworkService.shared.getFirstNonNilImageURL(imageLinks: book.bookInfo?.imageLinks) {
                                KFImage(imageURL)
                                    .resizable()
                                    .frame(width: 180, height: 250)
                                    .rotationEffect(.degrees(viewModel.getRotationAngle(from: index)))
                                    .zIndex(Double(-index))
                            }
                            
                        }
                    }
                    VStack() {
                        Text("Books in the library :")
                            .font(.title.weight(.semibold))
                        
                        ForEach(0..<booksInLibrary.count, id: \.self) { index in
                            let book = booksInLibrary[index]
                            
                            BookCell(group: group, book: book, library: library) {
                                withAnimation {
                                    appState.showDetails = true
                                    viewModel.selectedLibrary = library
                                    viewModel.selectedIndex = index
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    Spacer()
                }
                .padding()
                .tag(library.tag)
            }
        }
        .onReceive(viewModel.$selectedPage, perform: { value in
            viewModel.setStates(from: value)
        })
        .tabViewStyle(.page(indexDisplayMode: .never))
        .tabViewStyle(PageTabViewStyle())
    }
    
    var tabGeometryReader: some View {
        GeometryReader { geo in
            Color.clear
                .preference(key: TabWidthPreferenceKey.self, value: geo.size.width)
                .onPreferenceChange(TabWidthPreferenceKey.self) { value in
                    viewModel.tabWidth = value
                }
        }
    }
    
    var rectangleBackground: some View {
        HStack {
            if viewModel.selectedLibrary == .finished { Spacer() }
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(viewModel.selectedColor)
                .frame(width: viewModel.tabWidth)
            if viewModel.selectedLibrary == .toRead { Spacer() }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(group: BookGroup())
    }
}
