//  MissionScreenView.swift
//  Tickers
//
//  Created by Julia Morales on 19/06/23.
//

import SwiftUI
struct AchievementScreenView: View {
    @ObservedObject var achievementViewModel: AchievementViewModel
    
    let columns = [GridItem(.fixed(335))]
    
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                ScrollView{
                    LazyVGrid(columns: columns, alignment: .center) {
                        ForEach(achievementViewModel.achievements.filter { achievement in return achievement.isCompleted }) { achievement in
                            AchievementCellView(achievement: achievement)
                        }
                    }
                    .padding(.bottom, 15)
                    LazyVGrid(columns: columns, alignment: .center) {
                        ForEach(achievementViewModel.achievements.filter { achievement in return !achievement.isCompleted }) { achievement in
                            AchievementCellView(achievement: achievement)
                        }
                    }
                }
                
            }
                    .background(Color("LightGrey"))
                    .navigationCustom(leadingText: "Conquistas", trailingText: "")
          }
        }
    }


struct MissionScreenView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementScreenView(achievementViewModel: AchievementViewModel())
    }
}
