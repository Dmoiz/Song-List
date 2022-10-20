//
//  Song+CoreDataClass.swift
//  Song List
//
//  Created by Diego Moreno on 19/10/22.
//
//

import Foundation
import CoreData

@objc(Song)
public class Song: NSManagedObject {

    var song: String = ""
    var author: String = ""
    var imageUrl: String = ""
    var genre : String = ""
    
    func getSongName() -> String {
        return songName!
    }
    
    func getSongDesc() -> String {
        return songDesc!
    }
    
    func getImageUrl() -> String {
        return songImage!
    }
    
    func getGenre() -> String {
        return songGenre!
    }
    
}
