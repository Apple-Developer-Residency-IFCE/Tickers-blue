//
//  RadioButtonView.swift
//  Tickers
//
//  Created by userext on 25/05/23.
//

import SwiftUI


struct RadioButtonView: View {
    var text: String
    @Binding var isTapped : Bool
    
    func imagemBotao() -> String {
        return isTapped ? "Checkbox" : "Square"
    }
    
    
    var body: some View {
        let imagem = imagemBotao()
        
        Button {
            isTapped.toggle()
        } label: {
            HStack{
                Label(text, image: imagem)
            }
            
            //        HStack {
            //            Image("Square")
            //                .overlay {
            //                    isTapped ? Image("Checkbox") : Image("Square")
            //                }
            //                .onTapGesture {
            //                    isTapped.toggle()
            //                }
            //            Text(text)
            //        }
            
        }
        
    }
    
    struct RadioButtonView_Previews: PreviewProvider {
        static var previews: some View {
            RadioButtonView(text: "HELP", isTapped: .constant(false))
        }
    }
}
