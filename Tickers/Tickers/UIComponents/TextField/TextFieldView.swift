//
//  TextFieldView.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 06/06/23.
//

import SwiftUI


let customFont = Font.tickerFont(font: .bold, size: .extraLarge)
let customComent =  Font.tickerFont(font: .regular, size: .small)

struct TextFieldView: View {
    @State private var nome: String = ""
    var body: some View {
        VStack(alignment: .leading){
            Text("Seu nome")
                .font(customFont)
                .foregroundColor(.blue)
            
                Text("Define como os tickers chamarão você")
                    .font(customComent)
                    .padding(.bottom)
                
                    TextField("Escreva aqui seu nome", text: $nome)
                .padding(.leading, 10)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 0.5)
                        .frame(height: 50)
                }
                
            
        }.padding(10)
    }
}
    struct TextFieldView_Previews: PreviewProvider {
        static var previews: some View {
            TextFieldView()
        }
    }

