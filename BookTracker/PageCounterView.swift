//
//  PageCounterView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 16/06/2022.
//

import SwiftUI

struct PageCounterView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        DismissButton { dismiss() }
    }
}

struct PageCounterView_Previews: PreviewProvider {
    static var previews: some View {
        PageCounterView()
    }
}
