//
//  MissionCellView.swift
//  Tickers
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct MissionCellView: View {

    var tasksCompleted: Int
    var totalTasks: Int
    var title: String
    var description: String
    var color: Color
    var background: Color
    
    var body: some View {
        HStack() {
            Image("Challenge")
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 68, height: 68)
                        .foregroundColor(color)
                )
                .padding(.leading, 15)
            
            VStack(alignment: .leading, spacing: 0){
                Text(title)
                    .font(Font.tickerFont(font: .bold, size: .xxl))
                    .foregroundColor(.black)
                Text(description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, 15)
                    .font(Font.tickerFont(font: .regular, size: .regular))
                    .foregroundColor(.black)
                HStack{
                    ProgressView(value: Double(tasksCompleted), total: Double(totalTasks))
                        .frame(height: 6.0)
                        .scaleEffect(x:1, y: 2.5, anchor: .center)
                        .tint(color)
                        .background(background)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text("\(tasksCompleted)/\(totalTasks)")
                        .padding(.trailing, 0)
                        .padding(.leading, 0).opacity(0.4)
                        .font(Font.tickerFont(font: .bold, size: .medium))
                }
            }.padding(.leading, 15)
        }.padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
            )
    }
}

struct MissionCellView_Previews: PreviewProvider {
    static var previews: some View {
        MissionCellView(tasksCompleted: 1, totalTasks: 10, title: "Primeira Vez", description: "Finalize o seu primeiro pomodoro do dia e ganhe 50 xp", color: .init("PinkMissionScreen"), background: .init("LightPinkMissionScreen"))
    }
}
