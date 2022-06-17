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
                
                ZStack {
                    Circle()
                        .trim(from: 0, to: CGFloat(viewModel.maximumCompletionAmount))
                        .stroke(Color.ui.darkBlueGray.opacity(0.5), lineWidth: 20)
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(180))
                    
                    Circle()
                        .trim(from: 0, to: CGFloat(viewModel.completionAmount))
                        .stroke(Color.ui.orchid, lineWidth: 20)
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(180))
                }
                
                HStack(spacing: 30) {
                    Button {
                        viewModel.decrementProgress()
                    } label: {
                        Image(systemName: SFSymbols.minusCircle.rawValue)
                            .font(.title)
                            .frame(width: 35, height: 35)
                            .foregroundColor(.ui.darkBlueGray)
                    }

                    Text("Page \(Int(viewModel.pagesRead)) over \(Int(viewModel.totalPages))")
                        .font(.title2)
                        .bold()
                    
                    Button {
                        viewModel.incrementProgress()
                    } label: {
                        Image(systemName: SFSymbols.plusCircle.rawValue)
                            .font(.title)
                            .frame(width: 35, height: 35)
                            .foregroundColor(.ui.darkBlueGray)
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
