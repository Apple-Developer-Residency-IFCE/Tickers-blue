//
//  DefinitionsView.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 06/06/23.
//

import SwiftUI

struct DefinitionsView: View {
    @State var pomodoroTimerValue: Float = 6
    @State var timeBetweenPomodoroValue: Float = 25
    let customFont = Font.tickerFont(font: .bold, size: .xxl)
    @State var shortRest: Float = 6
    @State var longRest: Float = 20
    @State var numberOfPomodoroUntilStop: Float = 6
    @Binding var isPresentingDefinition: Bool
    
    var body: some View {
        VStack(spacing: 15){
            HStack {
                Image("ButtonDefinicoes").padding(.leading, 20)
                Text("Definição").font(customFont).foregroundColor(.blue)
                Spacer()
                Button {
                    isPresentingDefinition = false
                } label: {
                    Image("ButtonExitPopups").padding(.trailing, 20)
                }
                
            }
            Divider()
            SliderCustom(timerValue: $pomodoroTimerValue, maxValue: 10, minValue: 0, title: "Mozinho")
            SliderCustom(timerValue: $timeBetweenPomodoroValue, maxValue: 50, minValue: 15, posFix: "min", title: "Pomodoros até a pausa")
            SliderCustom(timerValue: $shortRest, maxValue: 10, minValue: 4, posFix: "min", title: "Pomodoros até a pausa")
            SliderCustom(timerValue: $longRest, maxValue: 30, minValue: 15, posFix: "min", title: "Pomodoros até a pausa")
            SliderCustom(timerValue: $numberOfPomodoroUntilStop, maxValue: 10, minValue: 4, title: "Pomodoros até a pausa")
        }
    }
}

struct SliderCustom: View {
    @Binding var timerValue: Float
    var maxValue: Float
    var minValue: Float
    var posFix: String = ""
    var title: String = ""

    var body: some View {
        VStack(alignment:.center) {
            HStack(alignment: .bottom){
                Text(title)
                    .font(Font.tickerFont(font: .bold, size: .xxl))
                    .padding(.leading, 20)
                Spacer()
            }
                
            HStack {
                Button {
                    if(timerValue > minValue) {
                        timerValue -= 1.0
                    }
                } label: {
                    Image("rightArrow")
                }

                
                Slider(value: $timerValue, in: minValue...maxValue, step: 1) {
                    Text("Slider")
                }
                Button {
                    if(timerValue < maxValue) {
                        timerValue += 1.0
                    }
                } label: {
                    Image("leftArrow")
                }
            }.padding(.horizontal, 20)
            HStack(alignment: .center, spacing: 100) {
                if(posFix != ""){
                    Text("\(Int(minValue))\(posFix)")
                    Text("\(Int(timerValue))\(posFix)").font(Font.tickerFont(font: .regular, size: .medium)).foregroundColor(.blue)
                    Text("\(Int(maxValue))\(posFix)")
                }else {
                    Text("\(Int(minValue))").padding(.horizontal, 18)
                    Text("\(Int(timerValue))").padding(.horizontal, 18).font(Font.tickerFont(font: .regular, size: .medium)).foregroundColor(.blue)
                    Text("\(Int(maxValue))").padding(.horizontal, 18)
                }
                
            }.font(Font.tickerFont(font: .regular, size: .large))
            .padding(.top, -8)
        }

    }
}

struct DefinitionBinding: View {
    @State var isPresentingDefinition: Bool = false
    var body: some View {
        DefinitionsView(isPresentingDefinition: $isPresentingDefinition)
    }
}

struct DefinitionsView_Previews: PreviewProvider {
    static var previews: some View {
        DefinitionBinding()
    }
}
