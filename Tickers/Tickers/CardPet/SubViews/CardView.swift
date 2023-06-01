//
//  CardView.swift
//  Tickers
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct CardView: View {
    var locked: Bool
    var body: some View {
        VStack {
            if(!locked) {
                PetCardView()
            }else {
                EggCardView()
            }
        }.background {
            Color
                .blue
                .opacity(0.1)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(width: 240, height: 264)
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(locked: true)
    }
}
