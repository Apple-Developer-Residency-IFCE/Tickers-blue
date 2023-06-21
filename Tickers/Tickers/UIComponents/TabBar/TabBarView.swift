
//
//  TabBarView.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 06/06/23.
//

import SwiftUI

struct teste: View {
    @Binding var isPresenting: Bool
    var body: some View {
        return NavigationView {
            Text("Pomodoro Scene")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image("ButtonBack").onTapGesture {
                            isPresenting = false
                        }
                    }
                }
        }
        
    }
}

fileprivate struct Home: View {
    var body: some View {
        Text("Home")
    }
}

struct TabBarView: View {
    @State var currentSceneIndex = 0
    @State var lastSceneIndex = 0
    @State var isPresenting = false
    @State var name = "Caio"
    var home: HomeView
    var perfil: PerfilView

    init(home: HomeView, perfil: PerfilView, name: String = "Fulano") {
        self.name = name
        self.home = home
        self.perfil = perfil
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                TabView(selection: $currentSceneIndex){
                    home
                        .tabItem{
                            Label("", image: "")
                        }
                        .tag(0)
                        .onAppear {
                            lastSceneIndex = currentSceneIndex
                        }
                    Text("")
                        .tabItem{
                            Label("", image: "ButtonTimer")
                        }
                        .tag(1)
                        .onAppear {
                            currentSceneIndex = lastSceneIndex
                            isPresenting = true //aparecer pomodoro
                        }
                        .fullScreenCover(isPresented: $isPresenting) {
                            PomodoroView(viewModel: PomodoroViewModel(), isPresenting: $isPresenting)
                        }
                    perfil
                        .tabItem {
                            Label("", image: "")
                        }
                        .tag(2)
                        .onAppear {
                            lastSceneIndex = currentSceneIndex
                        }
                }
                
                HStack {
                    Button(action: {self.currentSceneIndex = 0}) {
                        VStack {
                            Image("ButtonHome")
                            Text("Home")
                                .font(.tickerFont(font: .bold, size: .medium))
                        }
                    }.padding(.top, 726).padding(.leading, 100)
                    Spacer()
                    Button(action: {self.currentSceneIndex = 2}) {
                        VStack {
                            Image( "ButtonConfig")

                            Text("Perfil")
                                .font(.tickerFont(font: .bold, size: .medium))
                        }

                    }.padding(.top, 726).padding(.trailing, 100)
                }
            }.background(.white)
            
        }.navigationHome(leadingText: "Seja bem vindo,", trailingText: name)
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(home: HomeView(viewModel: HomeViewModel()), perfil: PerfilView())
    }
}
