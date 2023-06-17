//
//  petModel.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 16/06/23.
//

import SwiftUI

struct Ticker {
    var id: UUID
    var title: String
    var EggImg: String
    var TickerImg: String
    var level: Int
    var maxProgress: Int
    var actualProgress: Int
    var locked: Bool
}

struct Tickers {
    var tickers: [Ticker]
}
