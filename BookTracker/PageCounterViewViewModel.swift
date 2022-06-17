//
//  PageCounterViewViewModel.swift
//  BookTracker
//
//  Created by Raphaël Payet on 17/06/2022.
//

import Foundation
import SwiftUI

class PageCounterViewViewModel: ObservableObject {
    @Published var completionAmount: Float = 0.0
    @Published var pagesRead: Float = 0
    @Published var progress: Float = 0
    let maximumCompletionAmount: Float = 0.5
    // Should be variable and according to the book
    let totalPages: Float = 200
}


extension PageCounterViewViewModel {
    func incrementProgress() {
        if (pagesRead < totalPages) {
            pagesRead += 1
            calculateProgress()
        }
    }
    
    func decrementProgress() {
        if (pagesRead > 0) {
            pagesRead -= 1
            calculateProgress()
        }
    }
    
    func calculateProgress() {
        let percentage = pagesRead/totalPages * 100
        progress = round(percentage * 10) / 10.0
        withAnimation {
            completionAmount = maximumCompletionAmount * pagesRead / totalPages
        }
    }
}
