//
//  PetcardView.swift
//  Tickers
//
//  Created by userext on 31/05/23.
//
import SwiftUI

struct Card: View {
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Haddinhas")
                    .foregroundColor(Color.blue)
                    .bold()
                    .font(.callout)
                Image(systemName: "heart.fill")
                    .foregroundColor(.blue.opacity(0.3))
            }
            Image("BabyCat")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 90)
                .padding(.leading, 20)
            Text("Lvl 1")
                .foregroundColor(.blue)
                .font(.callout)
                .bold()
                .padding(.top, 8)
            LvlProgressBarView(maxProgress: 40, actualProgress: 10)
                .padding(.top, 4)
        }
    }
}

struct PetCardView: View {
    var body: some View {
        Card()
    }
}

struct CardPetView_Previews: PreviewProvider {
    static var previews: some View {
        PetCardView()
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
