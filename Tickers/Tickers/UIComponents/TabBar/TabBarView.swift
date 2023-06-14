//
//  TabBarView.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 06/06/23.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        NavigationView {
            TabView{
                HomeView()
                    .tabItem{
                        Label("Home", image: "ButtonHome")
                    }
                Text("Tela Cronometro")
                    .tabItem{
                        Label("", image: "ButtonTimer")
                    }
                Text ("Tela Config")
                    .tabItem {
                        Label("Perfil", image: "ButtonConfig")
                    }
                
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
