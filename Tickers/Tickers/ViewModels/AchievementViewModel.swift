//
//  MissionViewModel.swift
//  Tickers
//
//  Created by Julia Morales on 20/06/23.
//

import SwiftUI
import CoreData

class AchievementViewModel: ObservableObject {
    let viewContext = DataController.shared.container.viewContext
    static var shared = AchievementViewModel()
    
    var achievementData: [AchievementDB] = []
    
    init(){
        fetch()
        if achievementData.isEmpty {
            progressiveAchievements = [
                Achievement(id: UUID(), isCompleted: false, isHidden: false, title: "Primeiros passos", description: "Complete um total de 5 horas em foco.", completeXP: 20),
                Achievement(id: UUID(), isCompleted: false, isHidden: true, title: "Pegando ritmo", description: "Complete um total de 10 horas em foco.", completeXP: 50),
                Achievement(id: UUID(), isCompleted: false, isHidden: true, title: "Concentração total", description: "Complete um total de 50 horas em foco.", completeXP: 100),
                Achievement(id: UUID(), isCompleted: false, isHidden: false, title: "Um dia de cada vez", description: "Entre em foco por 5 dias seguidos.", completeXP: 20),
                Achievement(id: UUID(), isCompleted: false, isHidden: true, title: "Virando rotina", description: "Entre em foco por 10 dias seguidos.", completeXP: 50),
                Achievement(id: UUID(), isCompleted: false, isHidden: true, title: "Persistência", description: "Entre em foco por 30 dias seguidos.", completeXP: 100)
            ]
            ponctualAchievements = [
                Achievement(id: UUID(), isCompleted: false, isHidden: false, title: "Hora do foco", description: "Conclua seu primeiro pomodoro.", completeXP: 15),
                Achievement(id: UUID(), isCompleted: false, isHidden: false, title: "Vida adulta", description: "Chegue ao nível máximo do seu primeiro Ticker.", completeXP: 50),
                Achievement(id: UUID(), isCompleted: false, isHidden: false, title: "Mestre dos bichinhos", description: "Desbloqueie todos os Tickers.", completeXP: 100)
            ]
        } else {
            progressiveAchievements = [
                Achievement(id: achievementData[0].id ?? UUID(), isCompleted: false, isHidden: false, title: "Primeiros passos", description: "Complete um total de 5 horas em foco.", completeXP: 20),
                Achievement(id: achievementData[1].id ?? UUID(), isCompleted: false, isHidden: true, title: "Pegando ritmo", description: "Complete um total de 10 horas em foco.", completeXP: 50),
                Achievement(id: achievementData[2].id ?? UUID(), isCompleted: false, isHidden: true, title: "Concentração total", description: "Complete um total de 50 horas em foco.", completeXP: 100),
                Achievement(id: achievementData[3].id ?? UUID(), isCompleted: false, isHidden: false, title: "Um dia de cada vez", description: "Entre em foco por 5 dias seguidos.", completeXP: 20),
                Achievement(id: achievementData[4].id ?? UUID(), isCompleted: false, isHidden: true, title: "Virando rotina", description: "Entre em foco por 10 dias seguidos.", completeXP: 50),
                Achievement(id: achievementData[5].id ?? UUID(), isCompleted: false, isHidden: true, title: "Persistência", description: "Entre em foco por 30 dias seguidos.", completeXP: 100)
            ]
            ponctualAchievements = [
                Achievement(id: achievementData[6].id ?? UUID(), isCompleted: false, isHidden: false, title: "Hora do foco", description: "Conclua seu primeiro pomodoro.", completeXP: 15),
                Achievement(id: achievementData[7].id ?? UUID(), isCompleted: false, isHidden: false, title: "Vida adulta", description: "Chegue ao nível máximo do seu primeiro Ticker.", completeXP: 50),
                Achievement(id: achievementData[8].id ?? UUID(), isCompleted: false, isHidden: false, title: "Mestre dos bichinhos", description: "Desbloqueie todos os Tickers.", completeXP: 100)
            ]
        }
        achievements = progressiveAchievements + ponctualAchievements
        
        updateAchievementStats()
        startAplication()
    }
    
    func startAplication(){
        if (achievementData.isEmpty){
            achievements.forEach { achievement in
                self.createAchievement(uuid: achievement.id)
            }
        }
        fetch()
        achievementData[0].isHidden = false
        achievementData[3].isHidden = false
        achievementData[6].isHidden = false
        achievementData[7].isHidden = false
        achievementData[8].isHidden = false
    }
    
    func fetch() {
        let fetchRequest: NSFetchRequest<AchievementDB> = AchievementDB.fetchRequest()
        
        guard let fetchData = try? viewContext.fetch(fetchRequest) else {
            return
        }
        
        achievementData = fetchData
    }
    
    func save() {
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
    }
    
    func createAchievement(uuid: UUID) {
        let newAchievement = AchievementDB(context: viewContext)
        newAchievement.id = uuid
        
        save()
    }
    
    func updateData(){
        for i in 0..<achievementData.count {
            achievements[i].isCompleted = achievementData[i].isDone
            achievements[i].isHidden = achievementData[i].isHidden
        }
        
    }
    
    func completeAchievement(id: UUID) {
        if achievementData.first(where: { $0.id == id })?.isDone == false{
            achievementData.first(where: { $0.id == id })?.isDone = true
            
            TickerViewModel.shared.addEXP(xp: Int16(achievements.first(where: { $0.id == id })!.completeXP))
            
            achievementData.forEach { achievement in
                if achievement.isDone && achievement != achievementData.last {
                    achievementData[(achievementData.firstIndex(of: achievement)! + 1)].isHidden = false
                }
            }
            
            save()
            updateData()
        }
    }
    
    func updateAchievementStats() {
//        let timeInPomodoro = UserStatsManager.shared.totalTimeInPomodoro
//        let pomodoroStreak = UserStatsManager.shared.pomodoroStreak
        
        if UserStatsManager.shared.totalTimeInPomodoro >= 180000 /**50 horas**/{
            completeAchievement(id: achievements[2].id)
        } else if UserStatsManager.shared.totalTimeInPomodoro >= 36000 /**10 horas**/{
            completeAchievement(id: achievements[1].id)
        } else if UserStatsManager.shared.totalTimeInPomodoro >= 18000 /**5 horas**/{
            completeAchievement(id: achievements[0].id)
        }
        
        if UserStatsManager.shared.pomodoroStreak >= 30 {
            completeAchievement(id: achievements[5].id)
        } else if UserStatsManager.shared.pomodoroStreak > 10 {
            completeAchievement(id: achievements[4].id)
        } else if UserStatsManager.shared.pomodoroStreak >= 5 {
            completeAchievement(id: achievements[3].id)
        }
        
        updateData()
    }
    
    @Published var progressiveAchievements: [Achievement] = []
    @Published var ponctualAchievements: [Achievement] = []
    @Published var achievements: [Achievement] = []
    
}

