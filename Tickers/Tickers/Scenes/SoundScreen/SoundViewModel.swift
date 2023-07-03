//
//  SoundViewModel.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 28/06/23.
//

import SwiftUI

class SoundViewModel: ObservableObject {
    @Published var sounds: [Sound]
    var runningSound: Int?
    init() {
        self.sounds = [
            Sound(name: "Chuva", id: 0),
            Sound(name: "Tempestade", id: 1),
            Sound(name: "Água", id: 2),
            Sound(name: "Lo-Fi", id: 3)
        ]
    }
    
    func download(sound id: Int) {
        sounds[id].downloaded.toggle()
    }
    
    func remove(sound id: Int) {
        sounds[id].downloaded.toggle()
    }
    
    func play(sound id: Int){
        if let runningId = runningSound {
            sounds[runningId].running = false
        }
        sounds[id].running.toggle()
        runningSound = id
    }
    
    func stop(sound id: Int) {
        sounds[id].running.toggle()
    }
}
