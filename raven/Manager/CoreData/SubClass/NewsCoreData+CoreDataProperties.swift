//
//  NewsCoreData+CoreDataProperties.swift
//  
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 10/12/24.
//
//

import Foundation
import CoreData


extension NewsCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsCoreData> {
        return NSFetchRequest<NewsCoreData>(entityName: "NewsCoreData")
    }

    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var summary: String?
    @NSManaged public var autor: String?
    @NSManaged public var date: String?

}
