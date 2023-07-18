//
//  soundView.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 27/06/23.
//

import SwiftUI

struct soundCardView: View {
    var sound: Sound
    @StateObject var viewModel: SoundViewModel
    
    var body: some View {
        HStack{
            Text(sound.name).padding(.leading, 10)
                .font(Font.tickerFont(font: .bold, size: .xxl))
                .padding(.vertical, 20)
            Spacer()
            
            SoundButton(imageName: sound.running ? "Type=Pause" : "Type=Play" ) {
                sound.running ? viewModel.stop(sound: sound.id): viewModel.play(sound: sound.id)
            }.padding(.trailing)
        }.background{
            Color.white
                .cornerRadius(20)
        }.padding(.horizontal, 15)
    }
}

struct SoundButton: View {
    var imageName: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(imageName)
                .resizable()
                .frame(maxHeight: 30)
                .foregroundColor(.white)
                .frame(maxWidth: 30)
        }
    }
}

struct soundViewBinding: View {
    @ObservedObject var viewModel = SoundViewModel()
    var body: some View {
        soundCardView(sound: viewModel.sounds[0], viewModel: viewModel)
    }
}

struct soundView_Previews: PreviewProvider {
    static var previews: some View {
        soundViewBinding()
    }
}
