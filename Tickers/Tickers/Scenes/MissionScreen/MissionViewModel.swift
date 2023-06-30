//
//  MissionViewModel.swift
//  Tickers
//
//  Created by Julia Morales on 20/06/23.
//

import SwiftUI

class MissionViewModel: ObservableObject {
    
    
    @Published var missions = [
        Mission(id: UUID(),
                isCompleted: false,
                title: "Hora do Foco",
                description: "Concluiu seu primeiro Pomodoro."),
        Mission(id: UUID(),
                isCompleted: false,
                progressValues: [8, 20],
                title: "Primeiros Passos",
                description: "Completou um total de 5 horas em foco."),
        Mission(id: UUID(),
                isCompleted: false,
                title: "Um Dia de Cada Vez",
                description: "Entre em foco por 5 dias seguidos."),
        Mission(id: UUID(),
                isCompleted: false,
                progressValues: [8, 20],
                title: "Pegando o Ritmo",
                description: "Complete um total de 20 horas em foco."),
        Mission(id: UUID(),
                isCompleted: false,
                progressValues: [8, 50],
                title: "Concentraçào Total",
                description: "Complete um total de 50 horasa em foco."),
        Mission(id: UUID(),
                isCompleted: false,
                progressValues: [7, 10],
                title: "Virando Rotina",
                description: "Entre em foco por 10 dias seguidos."),
        Mission(id: UUID(),
                isCompleted: false,
                progressValues: [7, 30],
                title: "Persistência",
                description: "Entre em foco por 30 dias seguidos."),
        Mission(id: UUID(),
                progressValues: [5, 10],
                isCompleted: false,
                title: "Pontapé Inicial",
                description: "Conclua um total de 10 diferentes tarefas."),
                
        Mission(id: UUID(),
                progressValues: [5, 25],
                isCompleted: false,
                title: "A Todo Vapor",
                description: "Conclua um total de 25 diferentes tarefas."),
        Mission(id: UUID(),
                progressValues: [5, 50],
                isCompleted: false,
                title: "Muito a Fazer",
                description: "Conclua um total de 50 diferentes tarefas.")
                
    ]
        
          
}

