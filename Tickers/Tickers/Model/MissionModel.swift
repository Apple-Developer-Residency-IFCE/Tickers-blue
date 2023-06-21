//
//  model.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 07/06/23.
//

import SwiftUI

struct Mission: Identifiable{
    let id: UUID
    var tasksCompleted: Int
    var totalTasks: Int
    var title: String
    var description: String
    var color: Color
    var background: Color
}

