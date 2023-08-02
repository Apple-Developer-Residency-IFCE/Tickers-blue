//
//  EggCardView.swift
//  Tickers
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct EggCardView: View {
    var pet = "blueEgg"
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 0){
                Image(pet)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 102)
                    .padding(.top, 32)

                Image("Locker")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 28)
                    .padding(.leading, 120)
                    .padding(.trailing, 16)
                    .padding(.bottom, 13)

            }
        }
    }
}

struct EggCardView_Previews: PreviewProvider {
    static var previews: some View {
        EggCardView()
            .background {
                Color
                    .blue
                    .opacity(0.1)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .frame(width: 160, height: 176)
                
            }
    }
}
