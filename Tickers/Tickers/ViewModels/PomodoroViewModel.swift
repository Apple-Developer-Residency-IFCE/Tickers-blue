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
    static var shared = PomodoroViewModel()
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //TODO:: Refazer a lógica do timner
//    let timer2 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
////        print("Timer fired!")
//    }
    
    @Published var isTimerRunning: Bool = false
    @Published var currentState: PomodoroState = .work
    @Published var isBreakTimeStarted = false
    @Published var didTimerEnd = false
    
    @Published var timeRemaining: Int = 25 * 60

    init() {
        setTimer()
    }
    
    var pomodoroTime = UserDefaults.standard.float(forKey: "pomodoroTime")
    var restTimer = UserDefaults.standard.float(forKey: "restTimer")
    
    func minutes() -> String{
        return String(format: "%02d", self.timeRemaining/60)
    }
    
    func seconds() -> String{
        return String(format: "%02d", self.timeRemaining%60)
    }
    
    func timerComplete(restTime: inout Bool) {
        UserStatsManager.shared.addToPomodoroStreak()
        TickerViewModel.shared.addEXP(xp: 15)
        setTimer()
    }
    
    func setTimer() {
        timeRemaining = Int(pomodoroTime) * 60
        
        pomodoroTime = UserDefaults.standard.float(forKey: "pomodoroTime")
        restTimer = UserDefaults.standard.float(forKey: "restTimer")
    }
    
    func runTimer(restTime: inout Bool){
        
        if isTimerRunning && timeRemaining > 0 {
            timeRemaining -= 1
            UserStatsManager.shared.addTime()
            if timeRemaining <= 0 {
                timerComplete(restTime: &restTime)
            }
        }
    }
    
    func resetTimer(restTime: inout Bool) {
        currentState = .work
        timeRemaining = Int(pomodoroTime * 60)
        isBreakTimeStarted = false
        restTime = false
    }
    
    func startTimer(restTime: inout Bool) {
        if timeRemaining <= 0 {
            timerComplete(restTime: &restTime)
                
            resetTimer(restTime: &restTime)
        } else {
            currentState = .work
            isTimerRunning = true
        }
        
        didTimerEnd = false
    }
    
    func stopTimer() {
//        timer = nil
        
        currentState = .pause
        isTimerRunning = false
    }
    
    func skipBreak(restTime: inout Bool) {
        if currentState == .work {
            isBreakTimeStarted = true
            currentState = .breakTime
            timeRemaining = Int(restTimer * 60)
            restTime = true
            isTimerRunning = true
        } else if currentState == .breakTime {
            timeRemaining = 0
            restTime = false
            isTimerRunning = false
        }
        
        // esse codigo funcionava quando havia mais de 1 pomodoro em seguida
//        if currentState == .breakTime {
//            currentState = .work
//            timeRemaining = 25 * 60
//            isBreakTimeStarted = false
//            restTime = false
//            isTimerRunning = true
//        } else if currentState == .work && !isBreakTimeStarted {
//            currentState = .breakTime
//            timeRemaining = 1 * 60
//            isBreakTimeStarted = true
//            restTime = true
//            isTimerRunning = true
//        }
        
        
    }
}
