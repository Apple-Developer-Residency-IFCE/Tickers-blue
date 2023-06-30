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
                isCompleted: true,
                title: "Hora do Foco",
                description: "Concluiu seu primeiro Pomodoro."),
        Mission(id: UUID(),
                isCompleted: true,
                title: "Primeiros Passos",
                description: "Completou um total de 5 horas em foco."),
        Mission(id: UUID(),
                isCompleted: true,
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
                isCompleted: false,
                title: "Vida Adulta",
                description: "Chegue ao nível Adulto do seu primeiro Ticker."),
        Mission(id: UUID(),
                isCompleted: false,
                title: "Coleção Completa",
                description: "Desbloqueie todos os Tickers.")
                
    ]
        
          
}

