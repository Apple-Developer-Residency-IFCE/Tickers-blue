//
//  MissionCellView.swift
//  Tickers
//
//  Created by userext on 01/06/23.
//

import SwiftUI
//progressview
struct MissionCellView: View {
        var nomeImagem: String
        var titulo: String
        var descricao: String
    
    var body: some View {
            HStack() {
                Image(nomeImagem)
                VStack(alignment: .leading){
                    Text(titulo)
                        .font(.title2)
                        .foregroundColor(.white)
                    Text(descricao)
                        .foregroundColor(.white)
                }
        }.padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray)
            )
    }
    
}

struct MissionCellView_Previews: PreviewProvider {
    static var previews: some View {
        MissionCellView(nomeImagem: "ChallengePink", titulo: "Primeira Vez", descricao: "Finalize o seu primeiro pomodoro e ganhe 50 xp")
    }
}
