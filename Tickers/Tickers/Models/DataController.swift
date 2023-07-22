//
//  DataController.swift
//  Tickers
//
//  Created by Ian Pacini on 21/07/23.
//

import Foundation
import CoreData

class DataController {
    static let shared = DataController()
    
    let container = NSPersistentContainer(name: "DataModel")
    
    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading data: \(error)")
            }
        }
    }
}
