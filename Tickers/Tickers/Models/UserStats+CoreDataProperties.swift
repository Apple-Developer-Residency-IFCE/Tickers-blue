//
//  UserStats+CoreDataProperties.swift
//  Tickers
//
//  Created by Ian Pacini on 24/07/23.
//
//

import Foundation
import CoreData


extension UserStats {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserStats> {
        return NSFetchRequest<UserStats>(entityName: "UserStats")
    }

    @NSManaged public var timeInPomodoro: Int64
    @NSManaged public var didPomodoro: Bool
    @NSManaged public var pomodoroStreak: Int16

}

extension UserStats : Identifiable {

}
