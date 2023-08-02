//
//  FocoView.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 06/06/23.
//

import SwiftUI

struct FocusView: View {
    @State var timerBool = false
    let customFont = Font.tickerFont(font: .bold, size: .xxxxl)
    @Binding var isPresentingFocus: Bool
    @ObservedObject var viewModel: PomodoroViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("\(viewModel.minutes()):\(viewModel.seconds())").foregroundColor(Color("BlueFoco")).font(customFont)
                    .offset(x:0, y: 230)
                    .padding(10)
                
                Image("IconBolhas1")
                    .offset(x:0, y: 230)
                Image("IconBolhas2")
                    .offset(x:50, y: 220)
                Image("IconBolhas3")
                    .offset(x:0, y: 210)
                Image("BabyCatSoninho")
                    .resizable()
                    .frame(width: 279, height: 213)
                    .offset(x:0, y: 180)
                
                Spacer()
                
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("ButtonBack").onTapGesture {
                        isPresentingFocus = false
                    }
                }
            }
        }
    }
}

fileprivate struct FocusViewBinding: View {
    @State var isPresentingFocus: Bool = true
    @State var timeRemaining: Int = 25*60
    var body: some View {
        FocusView(isPresentingFocus: $isPresentingFocus, viewModel: PomodoroViewModel())
    }
}

struct FocusView_Previews: PreviewProvider {
    static var previews: some View {
        FocusViewBinding()
    }
}
