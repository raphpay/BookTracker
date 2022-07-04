//
//  LocalOnlyContentView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 04/07/2022.
//

import SwiftUI
import RealmSwift

struct LocalOnlyContentView: View {
    
    @StateObject var viewRouter = ViewRouter()
    @ObservedResults(BookGroup.self) var bookGroups
    
    var body: some View {
        if let group = bookGroups.first {
            ContentView(viewRouter: viewRouter, group: group)
        } else {
            EmptyView()
                .onAppear {
                    $bookGroups.append(BookGroup())
                }
        }
    }
}

struct LocalOnlyContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocalOnlyContentView()
    }
}
