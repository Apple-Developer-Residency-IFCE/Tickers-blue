//
//  PomodoroView.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 06/06/23.
//

import SwiftUI



struct PomodoroView: View {
    
    @ObservedObject var viewModel: PomodoroViewModel
    
    let customFont = Font.tickerFont(font: .bold, size: .xxl)
    let customFontBotoes = Font.tickerFont(font: .bold, size: .large)
    
    @State var restTime: Bool = false
    @State var scalevalue = 1.0
    @State private var rotationAngle = 0.0
    @State private var offsetValue: CGFloat = 0.0
    @Binding var isPresenting: Bool
    @State var isPresentingFoco: Bool = false
    @State var isPresentingSounds: Bool = false
    @State var isPresentingDefinition: Bool = false
    
    var body: some View {
        NavigationView{
            VStack {
                StopWatchView(viewModel: viewModel, restTime: $restTime)
                    .padding(.top, 30)
                
                Spacer()
                
                ZStack(alignment: .center) {
                    Image("Ellipse")
                        .resizable()
                        .padding(.top, 40)
                        .frame(maxHeight: .infinity)

                    VStack{
                        
                        HStack {
                            if (restTime) {
                                
                                Image("BabyCatMimindo")
                                    .frame(width: 160, height: 130)
                                    .offset(x: 70, y: 120)
                                    .rotationEffect(Angle(degrees: rotationAngle))
                                    .offset(x: offsetValue)
                                    .transition(.identity)
                                    .onAppear {
                                        withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: true)) {
                                            rotationAngle = 5.0
                                            offsetValue = 50.0
                                            
                                        }
                                    }
                                
                                Image("IconZzZzz")
                                    .offset(x: 10, y: 10)
                                    .transition(.identity)
                                
                                
                            } else {
                                
                                Image("BabyCat")
                                    .resizable()
                                    .frame(width: 160, height: 130)
                                    .offset(x: 50, y: 100)
                                Image("IconBall")
                                    .offset(x: -180, y: 180)
                            }
                            
                        }
                        
                        Spacer()
                        
                        
                        HStack {
                            
                            VStack {
                                Image("ButtonFoco")
                                Text("Foco")
                                    .font(customFontBotoes)
                                    .foregroundColor(.blue)
                            }.onTapGesture {
                                isPresentingFoco = true
                            }
                            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                            .fullScreenCover(isPresented: $isPresentingFoco) {
                                FocoView(isPresentingFoco: $isPresentingFoco, viewModel: viewModel)
                            }
                            
                            
                            VStack {
                                Image("ButtonDefinicoes")
                                Text("Definiçoes")
                                    .font(customFontBotoes)
                                    .foregroundColor(.blue)
                            }.onTapGesture {
                                isPresentingDefinition = true
                            }
                            .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
                            .sheet(isPresented: $isPresentingDefinition) {
                                
                                if #available(iOS 16.0, *) {
                                    DefinitionsView(isPresentingDefinition: $isPresentingDefinition)
                                        .presentationDetents([.height(640)])
                                } else {
                                    DefinitionsView(isPresentingDefinition: $isPresentingDefinition)
                                }

                            }
                            
                            VStack {
                                Image("ButtonSons")
                                Text("Sons")
                                    .font(customFontBotoes)
                                    .foregroundColor(.blue)
                            }.onTapGesture {
                                isPresentingSounds = true
                            }
                            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                            .fullScreenCover(isPresented: $isPresentingSounds) {
                                SoundScreenView(viewModel: SoundViewModel())
                            }
                            
                        }
                        .padding(.bottom, 50)
                        
                    }
                    
                }
                .edgesIgnoringSafeArea(.bottom)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image("ButtonBack").onTapGesture {
                            isPresenting = false
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Pomodoro")
                            .font(customFont)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
    
    fileprivate struct pomodoroBinding: View {
        @State var isPresenting = true
        var body: some View {
            PomodoroView(viewModel: PomodoroViewModel(), isPresenting: $isPresenting)
        }
    }
    
    struct PomodoroView_Previews: PreviewProvider {
        static var previews: some View {
            pomodoroBinding()
        }
    }
    
}
