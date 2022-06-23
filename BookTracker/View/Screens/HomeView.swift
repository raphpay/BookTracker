//
//  HomeView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 17/06/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewViewModel()
    
    var body: some View {
        VStack {
            textTabBar
            
            Spacer()
        }
    }
    
    var textTabBar: some View {
        HStack {
            ForEach(bookCategories) { book in
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        viewModel.selectedBook = book.categoryName
                        viewModel.selectedColor = book.color
                    }
                } label: {
                    Text(book.text)
                        .font(.title2.weight(.semibold))
                }
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .foregroundStyle(viewModel.selectedBook == book.categoryName ? .primary : .secondary)
                .blendMode(viewModel.selectedBook == book.categoryName ? .overlay : .normal)
                .overlay(tabGeometryReader)
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
        .background(rectangleBackground)
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
            if viewModel.selectedBook == .finished { Spacer() }
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(viewModel.selectedColor)
                .frame(width: viewModel.tabWidth)
            if viewModel.selectedBook == .toRead { Spacer() }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
