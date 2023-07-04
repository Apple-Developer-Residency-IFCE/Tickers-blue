//
//  ButtonUp.swift
//  Tickers
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct ButtonUp: View {
    var body: some View {
        VStack {
            Button(action: {
                print("clicked2")
            }){
                RoundedRectangle(cornerRadius: 20)
                    .background()
                    .frame(width: 200, height: 20)
                    .overlay(Text("Pular pomodoro")
                        .foregroundColor(.white))
                    .foregroundColor(.purple)
                
            }
        }
    }
}

struct ButtonUp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonUp()
    }
}
