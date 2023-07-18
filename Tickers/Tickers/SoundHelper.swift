//
//  SoundHelper.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 17/07/23.
//

import Foundation
import AVFoundation

class SoundPlayer {
    static let soundPlayer: SoundPlayer = SoundPlayer()
    var audioPlayer: AVAudioPlayer?
    func play(path: URL?){
        do {
            if(path != nil){
                audioPlayer = try AVAudioPlayer(contentsOf: path!)
            }
            audioPlayer?.play()
            audioPlayer?.numberOfLoops = 100
            
        }catch {
            print("Deu ruim")
        }
    }
    
    func stop(){
        audioPlayer?.stop()
    }
    private init (){}
}
