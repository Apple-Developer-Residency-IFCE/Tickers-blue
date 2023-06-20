//
//  TextFieldView.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 06/06/23.
//

import SwiftUI




struct TextFieldView: View {
    let customFont = Font.tickerFont(font: .bold, size: .extraLarge)
    let customComent =  Font.tickerFont(font: .regular, size: .small)
    let title: String
    let subtitle: String
    @Binding var nome: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(customFont)
                .foregroundColor(.blue)
            
            Text(subtitle)
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

fileprivate struct TextFieldToPreview: View {
    @State var text: String = ""
    
    var body: some View {
        TextFieldView(title: "Seu nome",
                      subtitle: "Define como os tickers chamarão você",
                      nome: $text)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldToPreview()
    }
}

