//
//  SwiftUIView.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 06/06/23.
//

import SwiftUI

struct HomeView: View {
    let data = [
//        CardView(locked: false, title: "1"),
//        CardView(locked: false, title: "2"),
//        CardView(locked: false, title: "3"),
        Ticker(id: UUID(), title: "Hadinha", EggImg: "blueEgg", TickerImg: "BabyCat", level: 1, maxProgress: 10, actualProgress: 0, locked: false),
        Ticker(id: UUID(), title: "Hadinha", EggImg: "blueEgg", TickerImg: "BabyCat", level: 1, maxProgress: 10, actualProgress: 0, locked: true),
        Ticker(id: UUID(), title: "Hadinha", EggImg: "blueEgg", TickerImg: "BabyCat", level: 1, maxProgress: 10, actualProgress: 0, locked: true),
        Ticker(id: UUID(), title: "Hadinha", EggImg: "blueEgg", TickerImg: "BabyCat", level: 1, maxProgress: 10, actualProgress: 0, locked: true),
        Ticker(id: UUID(), title: "Hadinha", EggImg: "blueEgg", TickerImg: "BabyCat", level: 1, maxProgress: 10, actualProgress: 0, locked: true),
    ]
    
    let columns = [
        GridItem(.fixed(150)),
        GridItem(.fixed(150)),
    ]
    var body: some View {
//        VStack {
//            data[0]
//        }
        NavigationView{
            VStack(alignment: .leading){
                Text("Caio").padding(.leading, 38).font(.tickerFont(font: .bold, size: .xxl))
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(data, id: \.id) { item in
                            CardView(ticker: item)
                        }
                    }.padding(.horizontal)
                }.frame(minWidth: 120)
            }
            
        }
    }
}

struct HomeTabBar: View {
    var body: some View {
        TabBarView(home: HomeView(), perfil: AnyView(PerfilView()))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabBar()
    }
}
