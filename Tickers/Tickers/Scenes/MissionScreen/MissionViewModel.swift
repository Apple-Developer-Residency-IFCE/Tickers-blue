//
//  MissionViewModel.swift
//  Tickers
//
//  Created by Julia Morales on 20/06/23.
//

import SwiftUI

class MissionViewModel: ObservableObject {
    @Published var missions = [
        Mission(id: UUID(), tasksCompleted: 5, totalTasks: 10,
                title: "Primeira vez",
                description: "Finalize o seu primeiro pomodoro do dia e ganhe 50 de xp",
                color: .init("OrangeMissionScreen"),
                background: .init("LightOrangeMissionScreen")),
        Mission(id: UUID(), tasksCompleted: 3, totalTasks: 10,
                title: "Foco total",
                description: "Finalize dois pomodoro utilizando a função foco e ganhe um novo som.",
                color: .init("PinkMissionScreen"),
                background: .init("LightPinkMissionScreen")),
        Mission(id: UUID(), tasksCompleted: 9, totalTasks: 10,
                title: "Ninguém é de ferro",
                description: "Complete 4 pomodoros em sequência!",
                color: .init("BlueMissionScreen"),
                background: .init("LightBlueMissionScreen"))
    ]
                                    
}

