//
//  TimerManager.swift
//  Tickers
//
//  Created by Ian Pacini on 24/07/23.
//

import Foundation
import CoreData

class AchievementsManager {
    static let shared = AchievementsManager()
    
    let viewContext = DataController.shared.container.viewContext
    @Published var achievementData: [UserStats] = []
    
    init() {
        fetch()
        if achievementData.isEmpty {
            firstUse()
        }
    }
    
    func fetch() {
        let fetchRequest: NSFetchRequest<UserStats> = UserStats.fetchRequest()
        
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
    
    func firstUse() {
        let _ = UserStats(context: viewContext)
        
        save()
    }
    
    func addTime() {
        achievementData[0].timeInPomodoro += 1
        print(achievementData[0].timeInPomodoro)
        timedSave()
    }
    
    func timedSave() {
        if achievementData[0].timeInPomodoro.isMultiple(of: 300) {
            save()
        }
    }
}
