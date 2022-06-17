//
//  TemporaryView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 16/06/2022.
//

import SwiftUI

struct TemporaryView: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        Button {
            showSheet.toggle()
        } label: {
            Text("Go To Page counter view")
        }
        .sheet(isPresented: $showSheet) { PageCounterView() }

    }
}

struct TemporaryView_Previews: PreviewProvider {
    static var previews: some View {
        TemporaryView()
    }
}
