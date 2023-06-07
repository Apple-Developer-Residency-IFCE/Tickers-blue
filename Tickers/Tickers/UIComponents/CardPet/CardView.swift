//
//  CardView.swift
//  Tickers
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct CardView: View {
    var locked: Bool

    var maxProgress = 40
    var actualProgress = 0
    var title = "Haddinha"
    var pet = "BabyCat"
    var level = 1
    
    init(locked: Bool, _ maxProgress: Int = 40, _ actualProgress: Int = 0, _ title: String = "Haddinha", _ pet: String = "BabyCat", _ level: Int = 1) {
        self.locked = locked
        self.maxProgress = maxProgress
        self.actualProgress = actualProgress
        self.title = title
        self.pet = pet
        self.level = level
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
                Color
                    .blue
                    .opacity(0.1)
                    .cornerRadius(10)
            }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CardView(locked: false, 21, 20, "Tito", "BabyCat", 2)
            CardView(locked: true, 0, 0, "blueEgg", "blueEgg")
        }
        
    }
}
