//
//  PomodoroViewModel.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 20/06/23.
//

import SwiftUI

enum PomodoroState {
    case work // rodando
    case breakTime // tempo de descanso
    case pause // pausado
}


class PomodoroViewModel: ObservableObject {
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //TODO:: Refazer a lógica do timner
//    let timer2 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
////        print("Timer fired!")
//    }
    
    @Published var isTimerRunning: Bool = false
    @Published var currentState: PomodoroState = .work
    @Published var isBreakTimeStarted = false
    @Published var timeRemaining = 25 * 60
    
    func minutes() -> String{
        return String(format: "%02d", self.timeRemaining/60)
    }
    
    func seconds() -> String{
        return String(format: "%02d", self.timeRemaining%60)
    }
    
    func timerComplete(restTime: inout Bool) {
        if currentState == .work {
            currentState = .breakTime
            timeRemaining = 5 * 60
            isBreakTimeStarted = true
            restTime = true
        } else if currentState == .breakTime {
            currentState = .work
            timeRemaining = 25 * 60
            isBreakTimeStarted = false
            restTime = false
        }
    }
    
    func runTimer(restTime: inout Bool){
        
        if isTimerRunning && timeRemaining > 0 {
            timeRemaining -= 1
            AchievementsManager.shared.addTime()
            if timeRemaining <= 0 {
                timerComplete(restTime: &restTime)
            }
        }
    }
    
    func resetTimer(restTime: inout Bool) {
        currentState = .work
        timeRemaining = 25 * 60
        isBreakTimeStarted = false
        restTime = false
    }
    
    func startTimer(restTime: inout Bool) {
        if timeRemaining <= 0 {
            timerComplete(restTime: &restTime)
        } else {
            currentState = .work
            isTimerRunning = true
        }
    }
    
    func stopTimer() {
//        timer = nil
        
        currentState = .pause
        isTimerRunning = false
    }
    
    func skipBreak(restTime: inout Bool) {
        if currentState == .breakTime {
            currentState = .work
            timeRemaining = 25 * 60
            isBreakTimeStarted = false
            restTime = false
            isTimerRunning = true
        } else if currentState == .work && !isBreakTimeStarted {
            currentState = .breakTime
            timeRemaining = 5 * 60
            isBreakTimeStarted = true
            restTime = true
            isTimerRunning = true
        }
    }
}
