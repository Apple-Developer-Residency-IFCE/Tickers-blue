//
//  TimerManager.swift
//  Tickers
//
//  Created by Ian Pacini on 24/07/23.
//

import Foundation
import CoreData

class UserStatsManager {
    static var shared = UserStatsManager()
    
    private let viewContext = DataController.shared.container.viewContext
    @Published private var userData: [UserStats] = []
    
    init() {
        totalTimeInPomodoro = 0
        didTodayPomodoro = nil
        pomodoroStreak = 0
        
        fetch()
        if userData.isEmpty {
            firstUse()
        }
        updateData()
    }
    
    func fetch() {
        let fetchRequest: NSFetchRequest<UserStats> = UserStats.fetchRequest()
        
        guard let fetchData = try? viewContext.fetch(fetchRequest) else {
            return
        }
        
        userData = fetchData
    }
    
    func save() {
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
    }
    
    func firstUse() {
        let _ = UserStats(context: viewContext)
        
        
        save()
    }
    
    func addTime() {
        userData[0].timeInPomodoro += 1
        print(userData[0].timeInPomodoro)
        timedSave()
        updateData()
    }
    
    func timedSave() {
        if userData[0].timeInPomodoro.isMultiple(of: 300) {
            save()
        }
    }
    
    func updateData(){
        totalTimeInPomodoro = Int(userData[0].timeInPomodoro)
        didTodayPomodoro = userData[0].didPomodoro
        pomodoroStreak = Int(userData[0].pomodoroStreak)
        print("\(userData[0].pomodoroStreak) mozinho")
    }
    
    func addToPomodoroStreak() {
        let today = Date()
        
        if let lastPomodoroDate = UserDefaults.standard.object(forKey: "LastPomodoroDate") {
            if (lastPomodoroDate as! Date).formatted(date: .complete, time: .omitted) != today.formatted(date: .complete, time: .omitted) {
                didPomodoroToday()
                
                if userData[0].didPomodoro {
                    userData[0].pomodoroStreak += 1
                } else {
                    userData[0].pomodoroStreak = 0
                    
                }
                updateData()
                AchievementViewModel.shared.updateAchievementStats()
            }
        } else {
            UserDefaults.standard.set(today, forKey: "LastPomodoroDate")
            userData[0].didPomodoro = true
            userData[0].pomodoroStreak = 1
        }
    }
    
    func didPomodoroToday() {
        let calendar = Calendar(identifier: .gregorian)
        let lastPomodoroDate = UserDefaults.standard.object(forKey: "LastPomodoroDate")
        
        if calendar.isDateInYesterday(lastPomodoroDate as! Date) {
            userData[0].didPomodoro = true
        } else {
            userData[0].didPomodoro = false
        }
    }
    
    @Published var totalTimeInPomodoro: Int
    @Published var didTodayPomodoro: Bool?
    @Published var pomodoroStreak: Int
}
