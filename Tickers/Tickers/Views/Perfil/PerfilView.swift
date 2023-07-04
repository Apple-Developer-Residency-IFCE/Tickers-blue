//
//  PerfilView.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 06/06/23.
//

import SwiftUI

enum Appearence: String, CaseIterable {
    case light, dark, system
    
    var description: String {
        switch self {
        case .light:
            return "Claro"
        case .dark:
            return "Escuro"
        case .system:
            return "Seguir o padrão do Sistema"
        }
    }
    
    var toColorScheme: ColorScheme? {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return .none
        }
    }
}

struct PerfilView: View {
    @AppStorage("preferredAppearence") var preferredAppearence: Appearence?
    @AppStorage("text") var text: String = ""

    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Divider()
                TextFieldView(nome: $text)
                    .padding(.vertical, 27)
                Divider()
                Text("Modo Escuro")
                    .font(Font.tickerFont(font: .bold, size: .xxxl))
                    .foregroundColor(.blue)
                Text("Altera a aparência do app para o modo escolhido")
                    .font(Font.tickerFont(font: .bold, size: .regular))
                
                ForEach(Appearence.allCases, id: \.self) { theme in
                    RadioButtonView(text: theme.description, isTapped: theme == (preferredAppearence ?? .system))
                        .onTapGesture {
                            preferredAppearence = theme
                        }
                }
                Divider()
                Spacer()
            }.navigationPreferences(leadingText: "Perfil e Preferências")
                .padding()
        }
    }
    
    struct PerfilView_Previews: PreviewProvider {
        static var previews: some View {
            PerfilView()
        }
    }
}

