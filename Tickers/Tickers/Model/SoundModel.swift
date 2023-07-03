//
//  SoundModel.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 28/06/23.
//

import SwiftUI

struct Sound: Identifiable {
    let name: String
    let id: Int
    var downloaded: Bool = false
    var running: Bool = false
}
