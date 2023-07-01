//
//  HomeViewModel.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 16/06/23.
//

import SwiftUI

class TickerViewModel: ObservableObject {
    @Published var data = [
        Ticker(id: UUID(), title: "Hadinha", EggImg: "blueEgg", TickerImg: "BabyCat", level: 1, maxProgress: 10, actualProgress: 5, locked: false),
        Ticker(id: UUID(), title: "Hadinha", EggImg: "blueEgg", TickerImg: "BabyCat", level: 1, maxProgress: 10, actualProgress: 0, locked: true),
        Ticker(id: UUID(), title: "Hadinha", EggImg: "blueEgg", TickerImg: "BabyCat", level: 1, maxProgress: 10, actualProgress: 0, locked: true),
        Ticker(id: UUID(), title: "Hadinha", EggImg: "blueEgg", TickerImg: "BabyCat", level: 1, maxProgress: 10, actualProgress: 0, locked: true),
        Ticker(id: UUID(), title: "Hadinha", EggImg: "blueEgg", TickerImg: "BabyCat", level: 1, maxProgress: 10, actualProgress: 0, locked: true),
    ]
    
    @Published var name = "Caio"
}
