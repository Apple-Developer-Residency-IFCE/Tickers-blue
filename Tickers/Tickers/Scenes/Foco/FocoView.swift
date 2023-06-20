//
//  FocoView.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 06/06/23.
//

import SwiftUI

struct FocoView: View {
    @State var tomerBool = false
    let customFont = Font.tickerFont(font: .bold, size: .xxxxl)
    
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(StopWatchView(restTime: $tomerBool).minutes):\(StopWatchView(restTime: $tomerBool).seconds)").foregroundColor(Color("BlueFoco")).font(customFont)
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

        }
        //.padding()
        
    }
}

struct FocoView_Previews: PreviewProvider {
    static var previews: some View {
        FocoView()
    }
}
