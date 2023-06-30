//  MissionScreenView.swift
//  Tickers
//
//  Created by Julia Morales on 19/06/23.
//

import SwiftUI
struct MissionScreenView: View {
    @ObservedObject var missionViewModel: MissionViewModel
    
    let columns = [GridItem(.fixed(335))]
    
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                ScrollView{
                    LazyVGrid(columns: columns, alignment: .center) {
                        ForEach(missionViewModel.missions.filter { mission in return mission.isCompleted }) { mission in
                            MissionCellView(mission: mission)
                        }
                    }
                    .padding(.bottom, 15)
                    LazyVGrid(columns: columns, alignment: .center) {
                        ForEach(missionViewModel.missions.filter { mission in return !mission.isCompleted }) { mission in
                            MissionCellView(mission: mission)
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
        MissionScreenView(missionViewModel: MissionViewModel())
    }
}
