//
//  AchievementDB+CoreDataProperties.swift
//  Tickers
//
//  Created by Ian Pacini on 25/07/23.
//
//

import Foundation
import CoreData


extension AchievementDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AchievementDB> {
        return NSFetchRequest<AchievementDB>(entityName: "AchievementDB")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var isDone: Bool
    @NSManaged public var isHidden: Bool

}

extension AchievementDB : Identifiable {

}
