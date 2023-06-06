//
//  MissionCellView.swift
//  Tickers
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct MissionCellView: View {
    var nomeImagem: String
    var titulo: String
    var descricao: String
    var cor: String
    var corFundo: String
    
    var body: some View {
        HStack() {
            Image(nomeImagem)
            VStack(alignment: .leading){
                Text(titulo)
                    .font(Font.tickerFont(font: .bold, size: .xxxl))
                    .foregroundColor(.black)
                Text(descricao)
                    .font(Font.tickerFont(font: .regular, size: .large))
                    .foregroundColor(.black)
                HStack{
                    ProgressView(value: Double(4), total: Double(10))
                        .frame(width: 240, height: 8.0)
                        .scaleEffect(x:1, y: 2.5, anchor: .center)
                        .tint(Color(cor))
                        .background(Color(corFundo))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text("1/10")
                        .padding(.trailing, 0)
                        .padding(.leading, 0).opacity(0.4)
                        .font(Font.tickerFont(font: .bold, size: .medium))
                        .bold()
                }
            }
        }.padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
            )
    }
    
}

struct MissionCellView_Previews: PreviewProvider {
    static var previews: some View {
        MissionCellView(nomeImagem: "ChallengePink", titulo: "Primeira Vez", descricao: "Finalize o seu primeiro pomodoro do dia e ganhe 50 xp", cor: "PinkMissionScreen", corFundo: "LightPinkMissionScreen")
    }
}
