//
//  TickerCard+CoreDataProperties.swift
//  Tickers
//
//  Created by João Lucas G. on 06/07/23.
//
//

import Foundation
import CoreData


extension TickerCard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TickerCard> {
        return NSFetchRequest<TickerCard>(entityName: "TickerCard")
    }

    @NSManaged public var actual_xp: Int16
    @NSManaged public var egg_img: String?
    @NSManaged public var is_locked: Bool
    @NSManaged public var level: Int16
    @NSManaged public var name: String?
    @NSManaged public var ticker_img: String?
    @NSManaged public var total_xp: Int16
    @NSManaged public var id: UUID?

}

extension TickerCard : Identifiable {

}
