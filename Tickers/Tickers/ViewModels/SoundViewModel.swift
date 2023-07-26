//
//  SoundViewModel.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 28/06/23.
//

import AVFoundation
import SwiftUI

class SoundViewModel: ObservableObject {
    @Published var sounds: [Sound]
    var soundPlayer: SoundPlayer = SoundPlayer.soundPlayer
    var runningSound: Int?
    init() {
        self.sounds = [
            Sound(name: "Chuva", id: 0, path: "chuva"),
            Sound(name: "Tempestade", id: 1, path: "tempestade"),
            Sound(name: "Água", id: 2, path: "agua"),
            Sound(name: "Lo-Fi", id: 3, path: "Lo-Fi")
        ]
    }
    
    func play(sound id: Int){
        if let runningId = runningSound {
            sounds[runningId].running = false
        }
        sounds[id].running.toggle()
        runningSound = id
        
        guard let path = Bundle.main.path(forResource: sounds[id].path, ofType:"wav") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        soundPlayer.play(path: url)
    }
    
    func stop(sound id: Int) {
        sounds[id].running.toggle()
        soundPlayer.stop()
    }
}
