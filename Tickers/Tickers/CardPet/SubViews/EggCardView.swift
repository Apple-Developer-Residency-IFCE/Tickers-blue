//
//  EggCardView.swift
//  Tickers
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct EggCardView: View {
    var body: some View {
        HStack {
            VStack(alignment: .center){
                Image("be")
//                    .aspectRatio(contentMode: .fit)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 102)
                    .padding(.top, 29)
        
                Image("Locker")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 28)
                    .padding(.leading, 100)
                    .padding(.bottom, 20)

            }.background {
                Color
                    .blue
                    .opacity(0.1)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .frame(width: 160, height: 176)
            }.padding(25)
//            PetcardView()
            PetCardView()
                .background {
                Color
                    .blue
                    .opacity(0.1)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .frame(width: 160, height: 176)
                }.padding(25)
        }
        
        
    }
}

struct EggCardView_Previews: PreviewProvider {
    static var previews: some View {
        EggCardView()
    }
}
