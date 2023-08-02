//
//  petModel.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 16/06/23.
//

import SwiftUI

struct Ticker: Identifiable {
    var id: UUID
    var title: String
    var xp: Int16
    var EggImg: String
    var TickerImg: String
    var level: Int
    var maxProgress: Int
    var actualProgress: Int
    var locked: Bool
    var isSelected: Bool
}

struct Tickers {
    var tickers: [Ticker]
}
