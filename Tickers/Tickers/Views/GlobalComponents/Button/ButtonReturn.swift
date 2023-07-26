//
//  ButtonReturn.swift
//  Tickers
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct ButtonReturn: View {
    
    var buttonText: String = "Não, me leve de volta!"
    @State var btnReturn : Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                btnReturn = true
            }){
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 2)
                    .frame(width: 200, height: 30)
                    .overlay(Text(buttonText))
                    .font(Font.tickerFont(font: .bold, size: .regular))
                    .foregroundColor(Color("BlueFoco"))
            }
        }
    }
}

struct ButtonReturn_Previews: PreviewProvider {
    static var previews: some View {
        ButtonReturn()
    }
}
