//
//  Sounds+CoreDataProperties.swift
//  Tickers
//
//  Created by João Lucas G. on 06/07/23.
//
//

import Foundation
import CoreData


extension Sounds {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sounds> {
        return NSFetchRequest<Sounds>(entityName: "Sounds")
    }

    @NSManaged public var download: Bool
    @NSManaged public var id: UUID?
    @NSManaged public var repo: String?
    @NSManaged public var running: Bool
    @NSManaged public var url: String?

}

extension Sounds : Identifiable {

}
