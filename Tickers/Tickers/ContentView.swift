//
//  ContentView.swift
//  Tickers
//
//  Created by userext on 23/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Texto em negrito")
                .font(Font.nunitoFont(font: .bold, size: .xxxl))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//(Font.nunitoFont(font: .bold, size: .extraLarge))
