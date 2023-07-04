//
//  CardView.swift
//  Tickers
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct CardView: View {
//    var ticker: Ticker
    var locked: Bool

    var maxProgress = 40
    var actualProgress = 0
    var title = "Haddinha"
    var pet = "BabyCat"
    var level = 1
    
    init(ticker: Ticker){
//        self.ticker  = ticker
        
        if(ticker.locked){
            pet = ticker.EggImg
        }else {
            pet = ticker.TickerImg
        }
        locked = ticker.locked
        maxProgress = ticker.maxProgress
        actualProgress = ticker.actualProgress
        title = ticker.title
        level = ticker.level
    }

    var body: some View {
        VStack {
            if(!locked) {
                PetCardView(maxProgress, actualProgress, title, pet, "Lvl \(level)")
            }else {
                EggCardView(pet: pet)

            }
        }.frame(width: 160, height: 176)
        
            .background {
                Color("whiteContainer")
                    .cornerRadius(10)
            }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
//            CardView(locked: false, maxProgress: 10, actualProgress: 0, title: "Gaa", pet: "BabyCat", level: 1)
            CardView(ticker: Ticker(id: UUID(), title: "Gaa", EggImg: "blueEgg", TickerImg: "BabyCat", level: 1, maxProgress: 10, actualProgress: 0, locked: false))
            CardView(ticker: Ticker(id: UUID(), title: "Gaa", EggImg: "blueEgg", TickerImg: "BabyCat", level: 1, maxProgress: 10, actualProgress: 0, locked: true))
        }
        
    }
}
