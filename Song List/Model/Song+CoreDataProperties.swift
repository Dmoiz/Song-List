//
//  Song+CoreDataProperties.swift
//  Song List
//
//  Created by Diego Moreno on 19/10/22.
//
//

import Foundation
import CoreData

extension Song {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song")
    }

    @NSManaged public var songName: String?
    @NSManaged public var songDesc: String?
    @NSManaged public var songImage: String?
    @NSManaged public var songGenre: String?

}

extension Song : Identifiable {

}
