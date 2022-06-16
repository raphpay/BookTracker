//
//  PageCounterView.swift
//  BookTracker
//
//  Created by Raphaël Payet on 16/06/2022.
//

import SwiftUI

struct PageCounterView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var completionAmount = 0.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let totalPages: Float = 200
    @State var pagesRead: Float = 0
    @State var progress: Float = 0

    
    var body: some View {
        ZStack {
            Background()
            
            VStack {
                DismissButton { dismiss() }
                    .padding(.bottom)
                
                Text("\(String(format: "%.1f", progress))% Completed")
                    .font(.title)
                    .bold()
                
                ZStack {
                    Circle()
                        .trim(from: 0, to: 0.5)
                        .stroke(Color.ui.darkBlueGray.opacity(0.5), lineWidth: 20)
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(180))
                    
                    Circle()
                        .trim(from: 0, to: completionAmount)
                        .stroke(Color.ui.orchid, lineWidth: 20)
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(180))
                }
                
                HStack(spacing: 30) {
                    Button {
                        decrementProgress()
                    } label: {
                        Image(systemName: SFSymbols.minusCircle.rawValue)
                            .font(.title)
                            .frame(width: 35, height: 35)
                            .foregroundColor(.ui.darkBlueGray)
                    }

                    Text("Page \(Int(pagesRead)) over \(Int(totalPages))")
                        .font(.title2)
                        .bold()
                    
                    Button {
                        incrementProgress()
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
    
    func incrementProgress() {
        pagesRead += 1
        calculateProgress()
    }
    
    func decrementProgress() {
        pagesRead -= 1
        calculateProgress()
    }
    
    func calculateProgress() {
        let percentage = pagesRead/totalPages * 100
        progress = round(percentage * 10) / 10.0
    }
}

struct PageCounterView_Previews: PreviewProvider {
    static var previews: some View {
        PageCounterView()
    }
}
