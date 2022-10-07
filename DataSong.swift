//
//  DataSong.swift
//  Song List
//
//  Created by Diego Moreno on 6/10/22.
//

import UIKit

protocol dataSongs {
    var imageUrl: String { get set}
    var song: String { get set}
    var author: String { get set}
    
    // Getters
    func getImageUrl() -> String
    func getTitle() -> String
    func getSubTitle() -> String

}
