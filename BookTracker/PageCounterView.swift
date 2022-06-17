//
//  PageCounterView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 16/06/2022.
//

import SwiftUI

struct PageCounterView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = PageCounterViewViewModel()

    
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
                    }

                    Text("Page \(Int(viewModel.pagesRead)) over \(Int(viewModel.totalPages))")
                        .font(.title2)
                        .bold()
                    
                    StepperButton(systemName: SFSymbols.plusCircle.rawValue) {
                        viewModel.incrementProgress()
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct PageCounterView_Previews: PreviewProvider {
    static var previews: some View {
        PageCounterView()
    }
}

struct StepperButton: View {
    
    var systemName: String
    var action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .font(.title)
                .frame(width: 35, height: 35)
                .foregroundColor(.ui.darkBlueGray)
        }
    }
}
