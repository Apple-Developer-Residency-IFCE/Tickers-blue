//
//  PomodoroView.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 06/06/23.
//

import SwiftUI

let customFont = Font.tickerFont(font: .bold, size: .xxl)
let customFontBotoes = Font.tickerFont(font: .bold, size: .large)

struct PomodoroView: View {
    @State var restTime: Bool = false
    
    var body: some View {
        
        VStack {
            Text("Pomodoro")
                .font(customFont)
                .foregroundColor(.blue)
                .padding(.top, 15)
            
            StopWatchView(restTime: $restTime)
                .padding(.top, 30)
            
            Spacer()
            
            ZStack(alignment: .center) {
                Image("Ellipse")
                    .resizable()
                    .padding(.top, 40)
                    .frame(height: .infinity)
                
                VStack{
                    
                    HStack {
                        if (restTime) {
                            
                            Image("BabyCatMimindo")
//                                .resizable()
                                .frame(width: 160, height: 130)
                                .offset(x: 70, y: 120)
                            Image("IconZzZzz")
                                .offset(x: 10, y: 10)
                            
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
                        }
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                        
                        
                        VStack {
                            Image("ButtonDefinicoes")
                            Text("Definiçoes")
                                .font(customFontBotoes)
                                .foregroundColor(.blue)
                        }
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
                        
                        
                        
                        VStack {
                            Image("ButtonSons")
                            Text("Sons")
                                .font(customFontBotoes)
                                .foregroundColor(.blue)
                        }
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                        
                    }
                    .padding(.bottom, 50)
                    
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
            
            
            
            
        }
    }
    
    
    struct PomodoroView_Previews: PreviewProvider {
        static var previews: some View {
            PomodoroView()
        }
    }
    
}
