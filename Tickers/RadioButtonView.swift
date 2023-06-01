//
//  RadioButtonView.swift
//  Tickers
//
//  Created by userext on 25/05/23.
//

import SwiftUI


struct RadioButtonView: View {
    var text : String
    @Binding var isTapped : Bool
    
    var body: some View {
        HStack {
            Image("Square")
                .overlay {
                    isTapped ? Image("Checkbox") : Image("Square")
                }
                .onTapGesture {
                    isTapped.toggle()
                }
            Text(text)
        }
        
    }
    
}

struct RadioButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonView(text: "cuscuz", isTapped: .constant(false))
    }
}
