//
//  MissionCellView.swift
//  Tickers
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct MissionCellView: View {
    
    var progressValues: [Int]?
    var title: String
    var description: String
    
    let background : UIColor
    
    var body: some View {
        
        
        
        
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 335, height: 88)
                .foregroundColor(.red)
            Group{
                HStack {
                    Image("Statelocked")
                        .padding(.trailing, -10)
                    VStack(alignment: .leading, spacing: 0){
                        Text(title)
                            .font(Font.tickerFont(font: .bold, size: .large))
                            .foregroundColor(.black)
                        Text(description)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.trailing, 15)
                            .font(Font.tickerFont(font: .regular, size: .medium))
                            .foregroundColor(.black)
                        
                        HStack(){
                            createProgressBar()
                        }
                        .padding(.trailing, 10)
                        
                    }
                    .frame(width: 250, height: 72)
                }
            }
            .background{
                Rectangle()
                    .frame(width: 307, height: 72)
                    .foregroundColor(.red)
            }
        }
    }
    
    @ViewBuilder func createProgressBar() -> some View {
        if let progressValues {
            let tasksCompleted = progressValues[0]
            let totalTasks = progressValues[1]

            ProgressView(value: Double(tasksCompleted), total: Double(totalTasks))
                .frame(width: 200, height: 6.0)
                .scaleEffect(x:1, y: 2.5, anchor: .center)
              
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text("\(tasksCompleted)/\(totalTasks)")
                .padding(.trailing, 0)
                .padding(.leading, 0).opacity(0.4)
                .font(Font.tickerFont(font: .bold, size: .medium))
        } else {
            EmptyView()
        }
    }
}

struct MissionCellView_Previews: PreviewProvider {
    static var previews: some View {
        MissionCellView(progressValues: [3, 10],title: "Primeira Vez", description: "Finalize o seu primeiro pomodoro do dia e ganhe 50 xp")
    }
}
            
