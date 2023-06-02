//
//  PetcardView.swift
//  Tickers
//
//  Created by userext on 31/05/23.
//
import SwiftUI


struct PetCardView: View {
    var maxProgress = 40
    var actualProgress = 10
    @State var title = "Haddinha"
    var pet = "BabyCat"
    var level = "Lvl 1"
    
    init(_ maxProgress: Int = 40, _ actualProgress: Int = 10, _ title: String = "Haddinha", _ pet: String = "BabyCat", _ level: String = "Lvl 1") {
        self.maxProgress = maxProgress
        self.actualProgress = actualProgress
        self.title = title
        self.pet = pet
        self.level = level
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .foregroundColor(Color.blue)
                    .bold()
                    .font(.callout)
                Image("Pen")
                    .resizable()
                    .frame(maxWidth: 12,maxHeight: 12)
                    .onTapGesture {
                        //Mudar o titulo
                    }
            }
            Image(pet)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 90)
                .padding(.leading, 20)
            Text(level)
                .foregroundColor(.blue)
                .font(.callout)
                .bold()
                .padding(.top, 8)
            
            LvlProgressBarView(maxProgress, actualProgress)
                .padding(.top, 4)
        }
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
