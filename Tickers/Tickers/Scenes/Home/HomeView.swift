//
//  SwiftUIView.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 06/06/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    let columns = [
        GridItem(.fixed(170)),
        GridItem(.fixed(170)),
    ]
    
    var body: some View {
        NavigationView{
            
            VStack(alignment: .leading){
                Divider()
                Text("Seus Tickers")
                    .padding(.top, 10)
                    .padding(.leading, 38)
                    .font(.tickerFont(font: .bold, size: .extraLarge)).foregroundColor(.blue)
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .center) {
                        ForEach(viewModel.data, id: \.id) { item in
                            CardView(ticker: item).padding(.top, 10)
                        }
                    }.padding(.horizontal)
                }.frame(minWidth: 440)
                Divider()
                    .padding(.top, -9).padding(.horizontal, -30)
            }.navigationHome(leadingText: "Seja bem vindo(a),", trailingText:viewModel.name)
                .background{
                Color("GrayBackground").padding(.bottom, 10)
            }.padding(.top, 10)
        }
    }
}

struct HomeTabBar: View {
    var body: some View {
        TabBarView(home: HomeView(viewModel: HomeViewModel()), perfil: PerfilView())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabBar()
    }
}
