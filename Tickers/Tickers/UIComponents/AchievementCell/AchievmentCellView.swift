//
//  MissionCellView.swift
//  Tickers
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct AchievementCellView: View {
    
    var isCompleted: Bool = false
    var progressValues: [Int]?
    var title: String
    var description: String
    
    init(achievement: Achievement) {
        self.isCompleted = achievement.isCompleted
        self.progressValues = achievement.progressValues
        self.title = achievement.title
        self.description = achievement.description
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 335, height: 88)
                .foregroundColor(isCompleted ? .init("AchievUnlockColor") : .white)
            Group{
                HStack {
                    Image(isCompleted ? "trophyUnlocked" : "trophyLocked")
                        .resizable()
                        .padding(.leading, 10)
                        .frame(width: 92, height: 82)
                        
                    VStack(alignment: .leading, spacing: 0){
                        Text(title)
                            .font(Font.tickerFont(font: .bold, size: .large))
                            .foregroundColor(isCompleted ? .black : .init("AchievLockText"))
                        Text(description)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.trailing, 15)
                            .font(Font.tickerFont(font: .regular, size: .medium))
                            .foregroundColor(isCompleted ? .black : .init("AchievLockText"))
                        
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
                    .foregroundColor(isCompleted ? .init("AchievUnlockColor") : .white)
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

struct AchievementCellView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementCellView(achievement: Achievement(id: UUID(), isCompleted: false, progressValues: [3, 10], title: "Primeira Vez", description: "Finalize o seu primeiro pomodoro do dia e ganhe 50 xp"))
    }
}
            
