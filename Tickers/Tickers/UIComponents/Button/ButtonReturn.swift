//
//  ButtonReturn.swift
//  Tickers
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct ButtonReturn: View {
    var body: some View {
        VStack {
            Button(action: {
                print("clicked")
            }){
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.purple, lineWidth: 2)
                    .frame(width: 200, height: 20)
                    .overlay(Text("Não, me leve de volta!"))
                    .foregroundColor(.purple)
            }
        }
    }
}

struct ButtonReturn_Previews: PreviewProvider {
    static var previews: some View {
        ButtonReturn()
    }
}
