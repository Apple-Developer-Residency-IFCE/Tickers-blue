
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
//                                            Button {
//                                                isPresenting = false
//                                            } label: {
//                                                Text("voltar")
//                                            }

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
    var home: HomeView
    var perfil: AnyView
    
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
                            teste(isPresenting: $isPresenting)
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
//                .padding(.horizontal, 65)
                
                HStack {
                    Button(action: {self.currentSceneIndex = 0}) {
                        VStack {
                            Image("ButtonHome")
                            Text("Home")
                        }.padding(.top, 720).padding(.leading, 100)
                    }
                    Spacer()
                    Button(action: {self.currentSceneIndex = 2}) {
                        VStack {
                            Image( "ButtonConfig")

                            Text("Perfil")
                        }.padding(.top, 720).padding(.trailing, 100)

                    }
                }
            }
            
        }
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(home: HomeView(), perfil: AnyView(PerfilView()))
    }
}
