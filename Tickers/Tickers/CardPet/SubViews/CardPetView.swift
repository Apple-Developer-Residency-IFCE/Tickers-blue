////
////  CardPetView.swift
////  Tickers
////
////  Created by userext on 30/05/23.
////
//
//import SwiftUI
//
//struct Card: View {
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Text("Haddinhas")
//                    .foregroundColor(Color.blue)
//                    .bold()
//                    .font(.title3)
//                Image(systemName: "heart.fill")
//                    .foregroundColor(.blue.opacity(0.3))
//            }
//            Image("BabyCat")
//                .padding(.leading, 20)
//            Text("Lvl 1")
//                .foregroundColor(.blue)
//                .bold()
//            LvlProgressBarView(maxProgress: 40, actualProgress: 10)
//        }.padding(20)
//    }
//}
//
//struct CardPetView: View {
//    var body: some View {
//        Card()
//            .background {
//                Color
//                    .blue
//                    .opacity(0.1)
//                    .cornerRadius(10)
//                    .shadow(radius: 5)
//                    .frame(width: 240, height: 264)
//            }
//    }
//}
//
//struct CardPetView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardPetView()
//    }
//}
