//
//  PerfilView.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 06/06/23.
//

import SwiftUI

struct PerfilView: View {
    @State var selectedOption: String?
   // @AppStorage("preferredColorScheme") var SelectTheme: AppColorScheme = .system
    
    
    let themes = ["Claro", "Escuro", "Seguir o padrão do Sistema"]
    
    func selectTheme (index:Int?){
    
    }
    
    
    var body: some View {
        VStack(alignment: .leading){
            // VStack(spacing: 0){
            Text("Modo Escuro")
                .font(Font.tickerFont(font: .bold, size: .xxxl))
                .foregroundColor(.blue)
            // .padding(10)
            Text("Altera a aparência do app para o modo escolhido")
                .font(Font.tickerFont(font: .bold, size: .regular))
            
            ForEach(themes, id: \.self) { theme in
                RadioButtonView(text: theme, isTapped: theme == selectedOption)
                    .onTapGesture {
                        selectedOption = theme
                    }
            }
            Divider()
        }
        .padding()
        

    }
   // fileprivate struct PerfilViewToPreview: View {
       
        
        
    struct PerfilView_Previews: PreviewProvider {
        static var previews: some View {
            PerfilView(selectedOption: "s")
        }
    }
}
    
