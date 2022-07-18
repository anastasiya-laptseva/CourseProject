//
//  SaveTable+CoreDataProperties.swift
//  
//
//  Created by Anastasiya Laptseva on 18.07.22.
//
//

import Foundation
import CoreData


extension SaveTable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SaveTable> {
        return NSFetchRequest<SaveTable>(entityName: "SaveTable")
    }

    @NSManaged public var dateField: String?
    @NSManaged public var saveField: String?

}
