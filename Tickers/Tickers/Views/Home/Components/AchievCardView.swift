//
//  AchievCardView.swift
//  Tickers
//
//  Created by João Lucas G. on 28/06/23.
//

import SwiftUI

struct AchievCardView: View {
    
    let isLocked:Bool
    let title:String
    let subtitle:String
    
    init(achievement: Achievement) {
        self.isLocked = !achievement.isCompleted
        self.title = achievement.title
        self.subtitle = achievement.description
    }
    
    var body: some View {
        VStack {
            AchievCard(isLocked: isLocked)
        }
    }
    
    @ViewBuilder func AchievCard (isLocked:Bool) -> some View {
        if isLocked {
            VStack {
                RoundedRectangle (cornerRadius: 20)
                    .fill(Color("AchievLockColor"))
                    .frame(width: 143, height: 173)
                    .overlay {
                        VStack {
                            Image("trophyLocked")
                            
                            Spacer()
                                .frame(height: 0)
                            
                            Text(title)
                                .font(Font.tickerFont(font: .bold, size: .regular))
                                .foregroundColor(Color("AchievLockText"))
                            Text(subtitle)
                                .font(Font.tickerFont(font: .regular, size: .medium))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color("AchievLockText"))
                        }
                        .padding(.bottom, 17)
                    }
            }
        } else {
            VStack {
                RoundedRectangle (cornerRadius: 20)
                    .fill(Color("AchievUnlockColor"))
                    .frame(width: 143, height: 173)
                    .overlay {
                        VStack {
                            Image("trophyUnlocked")
                            
                            Spacer()
                                .frame(height: 0)
                            
                            Text(title)
                                .font(Font.tickerFont(font: .bold, size: .regular))
                            Text(subtitle)
                                .font(Font.tickerFont(font: .regular, size: .medium))
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 17)
                    }
            }
        }
    }
}

struct AchievCardView_Previews: PreviewProvider {
    static var previews: some View {
        AchievCardView(achievement: Achievement(id: UUID(), isCompleted: true, isHidden: false, title: "Hora do foco", description: "Concluiu seu primeiro pomodoro", completeXP: 10))
    }
}
