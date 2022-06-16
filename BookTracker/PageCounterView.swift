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

    
    var body: some View {
        ZStack {
            Background()
            
            VStack {
                DismissButton { dismiss() }
                    .padding(.bottom)
                
                Text("47% Completed")
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
                        .onReceive(timer) { _ in
                            withAnimation {
                                if completionAmount == 0.5 {
                                    completionAmount = 0
                                } else {
                                    completionAmount += 0.1
                                }
                            }
                        }
                }
                
                HStack(spacing: 30) {
                    Button {
                        //
                    } label: {
                        Image(systemName: SFSymbols.minusCircle.rawValue)
                            .font(.title)
                            .frame(width: 35, height: 35)
                            .foregroundColor(.ui.darkBlueGray)
                    }

                    Text("Page 98 over 200")
                        .font(.title2)
                        .bold()
                    
                    Button {
                        //
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
