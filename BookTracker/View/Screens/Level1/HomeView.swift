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
    @ObservedResults(Book.self) var allBooks
    
    var body: some View {
        ZStack {
            VStack {
                statusBar
                textTabBar
                paginationTab
            }
            
            if appState.showDetails {
                let selectedBooks = viewModel.getBooks(from: viewModel.selectedLibrary)
                
                BooksView(selectedLibrary: $viewModel.selectedLibrary, selectedIndex: $viewModel.selectedIndex, books: selectedBooks)
            }
        }
        .fullScreenCover(isPresented: $viewModel.showAddBookSheet) {
            AddBookView()
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
            ForEach(Library.allCases) { library in
                let selectedBooks = viewModel.getBooks(from: library)
                
                HomeBooksView(library: library, books: selectedBooks,
                              showDetails: $appState.showDetails,
                              selectedLibrary: $viewModel.selectedLibrary, selectedIndex: $viewModel.selectedIndex)
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
        HomeView()
    }
}
