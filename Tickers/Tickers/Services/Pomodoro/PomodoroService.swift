//
//  PomodoroService.swift
//  Tickers
//
//  Created by João Lucas G. on 06/07/23.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class PomodoroService: ObservableObject {
    let viewContext = PersistenceController.shared.container.viewContext
    @Published var pomodoroList: [Pomodoro] = []
    static var instance: PomodoroService = PomodoroService()

    private init() {
       fetch()
    }

    func fetch() {
        let fetchRequest: NSFetchRequest<Pomodoro> = Pomodoro.fetchRequest()
        guard let fetchedPomodoros = try? viewContext.fetch(fetchRequest) else {
            return
        }
        pomodoroList = fetchedPomodoros
    }

    func createPomodoro(xp_won: String, status: String, progress: String, duration: String) {

        let newPomodoro = Pomodoro(context: viewContext)
        newPomodoro.id = UUID()
        newPomodoro.running =


        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("could not save (error) (error.userInfo)")
        }


    }

    func deletePomodoro(pomodoro: Pomodoro) {
        viewContext.delete(pomodoro)
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("Could not delete. (error), (error.userInfo)")
        }
    }


    func updatePomodoro(pomodoro: Pomodoro, xp_won: String, status: String, progress: String, duration: String ) {

        pomodoro.xp_won = xp_won
        pomodoro.status = status
        pomodoro.progress = progress
        pomodoro.duration = duration
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("Could not update. (error), (error.userInfo)")
        }
    }
}
