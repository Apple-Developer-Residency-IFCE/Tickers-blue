//
//  NavigationBarTextView.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 14/06/23.
//

import SwiftUI

struct NavigationBarTextView: View {
    var leadingText: String
    var trailingText: String
    init(_ leadingText: String = "", _ trailingText: String = "") {
        self.leadingText = leadingText
        self.trailingText = trailingText
    }
    
    var body : some View {
        HStack {
            Text(leadingText)
            Text(trailingText).foregroundColor(.blue)
        }.font(.tickerFont(font: .bold, size: .xxxl))
    }
}
struct NavigationBarTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarTextView("leading","trailing")
    }
}
