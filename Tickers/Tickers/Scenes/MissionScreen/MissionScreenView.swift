//  MissionScreenView.swift
//  Tickers
//
//  Created by Julia Morales on 19/06/23.
//

import SwiftUI
struct MissionScreenView: View {
    @ObservedObject var missionViewModel: MissionViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                Group{
                    ForEach(missionViewModel.missions){ mission in
                        MissionCellView(progressValues: mission.progressValues, title: mission.title, description: mission.description)
                    }
                    .padding(.bottom, 8)
                }.padding(.horizontal)
                Spacer()
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
