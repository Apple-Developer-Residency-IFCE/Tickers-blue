//
//  SwiftUIView.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 06/06/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var tickerViewModel: TickerViewModel
    @ObservedObject var achievementViewModel: AchievementViewModel
    
    let rows = [
        GridItem(.fixed(176))
    ]
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center) {
                Divider()
                    .padding(.bottom, 40)
                HStack {
                    Text("Escolha um Ticker para cuidar")
                        .font(.tickerFont(font: .bold, size: .extraLarge))
                    Spacer()
                    NavigationLink {
                        TickersView(viewModel: tickerViewModel)
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Ver Tudo")
                            .font(.tickerFont(font: .regular, size: .regular))
                    }
                    .padding(.trailing, 15)
                }
                .padding(.bottom, 30)
                ScrollView(.horizontal){
                    LazyHGrid(rows: rows) {
                        ForEach(tickerViewModel.data) { ticker in
                            CardView(ticker: ticker)
                                .padding(.trailing, 10)
                        }
                    }
                }
                .padding(.bottom, 40)
                HStack {
                    Text("Conquistas")
                        .font(.tickerFont(font: .bold, size: .extraLarge))
                    Spacer()
                    NavigationLink {
                        AchievementsView(achievementViewModel: AchievementViewModel())
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Ver Tudo")
                            .font(.tickerFont(font: .regular, size: .regular))
                    }
                    .padding(.trailing, 15)
                }
                .padding(.bottom, 30)
                ScrollView(.horizontal){
                    LazyHGrid(rows: rows) {
                        ForEach(achievementViewModel.achievements) { achievement in
                            AchievCardView(achievement: achievement)
                                .padding(.trailing, 10)
                        }
                    }
                }
                Spacer()
            }
            .navigationHome(leadingText: "Seja bem vindo(a),", trailingText: tickerViewModel.name)
            .padding(.leading, 15)
            .background{
                Color("GrayBackground")
                    .padding(.bottom, 10)
            }.padding(.top, 10)
        }
    }
}

struct HomeTabBar: View {
    var body: some View {
        TabBarView(home: HomeView(tickerViewModel: TickerViewModel(), achievementViewModel: AchievementViewModel()), perfil: PerfilView())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabBar()
    }
}
