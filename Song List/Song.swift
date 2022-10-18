//
//  Song.swift
//  Song List
//
//  Created by Diego Moreno on 6/10/22.
//

import UIKit

class Song : dataSongs {
    
    init(songName : String, songAuthor : String, songImageUrl : String, songGenre : String){
        song = songName
        author = songAuthor
        imageUrl = songImageUrl
        genre = songGenre
    }
    
    var song: String = ""
    var author: String = ""
    var imageUrl: String = ""
    var genre : String = ""
    
    func getTitle() -> String {
        return song
    }
    
    func getAuthor() -> String {
        return author
    }
    
    func getImageUrl() -> String {
        return imageUrl
    }
    
    func getGenre() -> String {
        return genre
    }
    
}
