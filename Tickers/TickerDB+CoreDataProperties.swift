//
//  TickerDB+CoreDataProperties.swift
//  Tickers
//
//  Created by Ian Pacini on 21/07/23.
//
//

import Foundation
import CoreData


extension TickerDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TickerDB> {
        return NSFetchRequest<TickerDB>(entityName: "TickerDB")
    }

    @NSManaged public var name: String?
    @NSManaged public var xp: Int16
    @NSManaged public var isSelected: Bool
    @NSManaged public var id: UUID?

}

extension TickerDB : Identifiable {

}
