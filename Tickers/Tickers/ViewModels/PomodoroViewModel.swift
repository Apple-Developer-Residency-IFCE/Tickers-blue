//
//  PomodoroViewModel.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 20/06/23.
//

import SwiftUI


class PomodoroViewModel: ObservableObject {
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Published var timeRemaining = 25 * 60
    
    func minutes() -> String{
        return String(format: "%02d", self.timeRemaining/60)
    }
    
    func seconds() -> String{
        return String(format: "%02d", self.timeRemaining%60)
    }
    
}
