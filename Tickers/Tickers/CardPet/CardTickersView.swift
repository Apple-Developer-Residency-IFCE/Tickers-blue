//
//  CardTickersView.swift
//  Tickers
//
//  Created by userext on 30/05/23.
//

import SwiftUI

struct CardTickersView: View {
    @State var blocked = true
    var body: some View {
        CardPetView()
    }
}

struct CardTickersView_Previews: PreviewProvider {
    static var previews: some View {
        CardTickersView()
    }
}
