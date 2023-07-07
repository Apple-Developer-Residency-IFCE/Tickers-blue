//
//  Achievements+CoreDataProperties.swift
//  Tickers
//
//  Created by João Lucas G. on 06/07/23.
//
//

import Foundation
import CoreData


extension Achievements {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Achievements> {
        return NSFetchRequest<Achievements>(entityName: "Achievements")
    }

    @NSManaged public var actual: Int16
    @NSManaged public var achievement_description: String?
    @NSManaged public var is_completed: Bool
    @NSManaged public var achievement_title: String?
    @NSManaged public var total: Int16
    @NSManaged public var xp_won: Int16
    @NSManaged public var id: UUID?

}

extension Achievements : Identifiable {

}
