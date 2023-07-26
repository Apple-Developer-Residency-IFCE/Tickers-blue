//
//  ButtonUp.swift
//  Tickers
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct ButtonUp: View {
    var buttonTextup: String = "Pular pomodoro"
    @State var btnAdvance : Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                btnAdvance = true
            }){
                RoundedRectangle(cornerRadius: 10)
                    .background()
                    .frame(width: 200, height: 30)
                    .overlay(Text(buttonTextup)
                        .font(Font.tickerFont(font: .bold, size: .regular))
                        .foregroundColor(.white))
                
                // .foregroundColor(.blue)
                
            }
        }
    }
}
    
    struct ButtonUp_Previews: PreviewProvider {
        static var previews: some View {
            ButtonUp()
        }
    }

