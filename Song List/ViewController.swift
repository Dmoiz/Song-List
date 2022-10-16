//
//  ViewController.swift
//  Song List
//
//  Created by Diego Moreno on 4/10/22.
//

import UIKit

class MainVC : UITableViewController {

    var music =  [Song(songName: "Twilight", songAuthor: "Rojuu", songImageUrl: "https://images.genius.com/24df596c2e657d773c3e6bc9477a1a25.1000x1000x1.jpg"),
                Song(songName: "I'm Still Standing", songAuthor: "Elton Jhon", songImageUrl: "https://m.media-amazon.com/images/I/61pWVkK-PRL._SL1280_.jpg"),
                Song(songName: "It's my Life", songAuthor: "Bon Jovi", songImageUrl: "https://m.media-amazon.com/images/I/5152DjOpXsL._SX355_.jpg"),
                Song(songName: "Me Porto Bonito", songAuthor: "Bad Bunny, Checho Corleone", songImageUrl: "https://i.scdn.co/image/ab67616d0000b27349d694203245f241a1bcaa72"),
                Song(songName: "Lo sabía", songAuthor: "Babi", songImageUrl: "https://i1.sndcdn.com/artworks-D54nGkc0dPvO-0-t500x500.jpg"),
                Song(songName: "A Medias Verdades", songAuthor: "Abhir Hathi", songImageUrl: "https://images.genius.com/6533c9cfc356ab23aaa956fe04609878.1000x1000x1.jpg"),
                Song(songName: "Banksy", songAuthor: "Recycled J", songImageUrl: "https://www.mondosonoro.com/wp-content/uploads/2021/09/Recycled-J-Sad-Summer.jpg"),
                Song(songName: "Hospital for Souls", songAuthor: "Bring me the Horizon", songImageUrl: "https://i.scdn.co/image/ab67616d0000b27360cf7c8dd93815ccd6cb4830"),
                Song(songName: "Sudores Fríos", songAuthor: "Natos y Waor & Recycled J", songImageUrl: "https://natosywaor.com/wp-content/uploads/2021/04/cd-hijos-de-la-ruina-vol-3-1.jpg"),
                Song(songName: "Suicide Season", songAuthor: "Bring me the Horizon", songImageUrl: "https://m.media-amazon.com/images/I/51XvDTAGK+L._SY355_.jpg")]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return music.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let songsCell : SongCell = tableView.dequeueReusableCell(withIdentifier: "songsCell", for: indexPath) as! SongCell
        songsCell.lbSong.text = music[indexPath.row].getTitle()
        songsCell.lbAuthor.text = music[indexPath.row].getAuthor()
        
        if let url = URL(string: music[indexPath.row].getImageUrl()){
            songsCell.ivPhoto.loadImage(from: url)
        }
        //let url = URL(string: music[indexPath.row].getImageUrl())
        //let data = try? Data(contentsOf: url!)
        //let loadedImage: UIImage = UIImage(data: data!)!
        //songsCell.ivPhoto.image = loadedImage
        
        return songsCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.music[sourceIndexPath.row]
        music.remove(at: sourceIndexPath.row)
        music.insert(movedObject, at: destinationIndexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueToDetail"){
            if let goToDetail = segue.destination as? DetailVC {
                goToDetail.lbSongName.text = music[tableView.indexPathForSelectedRow!.row].getTitle()
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
    }
}
