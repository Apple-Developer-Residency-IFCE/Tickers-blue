//
//  Pomodoro+CoreDataProperties.swift
//  Tickers
//
//  Created by João Lucas G. on 06/07/23.
//
//

import Foundation
import CoreData


extension Pomodoro {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pomodoro> {
        return NSFetchRequest<Pomodoro>(entityName: "Pomodoro")
    }

    @NSManaged public var running: Bool
    @NSManaged public var time: Int32
    @NSManaged public var id: UUID?

}

extension Pomodoro : Identifiable {

}
