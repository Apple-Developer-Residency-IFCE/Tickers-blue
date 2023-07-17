//
//  SoundScreenView.swift
//  Tickers
//
//  Created by userext on 29/05/23.
//

import SwiftUI


struct SoundScreenView: View {
    @ObservedObject var viewModel: SoundViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading){
                    Divider().padding()
                    HStack{
                        Image("ButtonSons").padding(.leading, 15)
                        Text("Sons").font(Font.tickerFont(font: .bold, size: .xxxl)).foregroundColor(.blue)
                        Spacer()
                    }
                    Group{
                        ForEach(viewModel.sounds){ sound in
                            soundCardView(sound: sound, viewModel: viewModel)
                        }
                    }
                    Spacer()
                }.navigationCustom(leadingText: "Pomodoro", trailingText: "")
            }
        }.task {
            try? await APICaller.shared.fetchSong()
        }
    }
}

fileprivate struct SoundScreenBinding: View {
    @State var isPresentingSounds: Bool = true
    var body: some View {
        SoundScreenView(viewModel: SoundViewModel())
    }
}
struct SoundScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SoundScreenBinding()
    }
}
