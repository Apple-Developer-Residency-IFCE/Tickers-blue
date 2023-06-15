//
//  NavigationBarTextView.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 14/06/23.
//

import SwiftUI

struct NavigationBarTextView: View {
    var leadingText: String = ""
    var trailingText: String = ""
    var centerText: String = ""
    init(_ leadingText: String, _ trailingText: String) {
        self.leadingText = leadingText
        self.trailingText = trailingText
    }
    
    var body : some View {
        if(centerText == ""){
            HStack {
                Text(leadingText)
                Text(trailingText).foregroundColor(.blue)
            }
        }else {
            Text(centerText)
        }
    }
}
struct NavigationBarTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarTextView("leading","trailing")
    }
}
