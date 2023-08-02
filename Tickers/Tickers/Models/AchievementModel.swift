//
//  model.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 07/06/23.
//

import SwiftUI

struct Achievement: Identifiable, Equatable{
    let id: UUID
    var isCompleted: Bool
    var isHidden: Bool
    var progressValues: [Int]?
    var title: String
    var description: String
    var completeXP: Int
}

