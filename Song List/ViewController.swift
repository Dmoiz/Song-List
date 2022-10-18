//
//  ViewController.swift
//  Song List
//
//  Created by Diego Moreno on 4/10/22.
//

//VISTA DE AÑADIR, PREGUNTAR PARA EL PICKER VIEW TANTO PARA QUE SE VEA CUANDO ESTÁ EN UNA CLASE PARA ÉL SOLO COMO HACER QUE DE IGUAL DEPENDIENDO DEL GÉNERO DE LA CANCIÓN
import UIKit

class MainVC : UITableViewController {
    
    var music =
    [Song(songName: "Twilight", songAuthor: "Rojuu", songImageUrl: "https://images.genius.com/24df596c2e657d773c3e6bc9477a1a25.1000x1000x1.jpg", songGenre: "Pop"),
     Song(songName: "I'm Still Standing", songAuthor: "Elton Jhon", songImageUrl: "https://m.media-amazon.com/images/I/61pWVkK-PRL._SL1280_.jpg", songGenre: "Pop"),
     Song(songName: "Me Porto Bonito", songAuthor: "Bad Bunny, Checho Corleone", songImageUrl: "https://i.scdn.co/image/ab67616d0000b27349d694203245f241a1bcaa72", songGenre: "Música Latina"),
     Song(songName: "Lo sabía", songAuthor: "Babi", songImageUrl: "https://i1.sndcdn.com/artworks-D54nGkc0dPvO-0-t500x500.jpg", songGenre: "Pop"),
     Song(songName: "A Medias Verdades", songAuthor: "Abhir Hathi", songImageUrl: "https://images.genius.com/6533c9cfc356ab23aaa956fe04609878.1000x1000x1.jpg", songGenre: "R&B/Soul"),
     Song(songName: "Banksy", songAuthor: "Recycled J", songImageUrl: "https://www.mondosonoro.com/wp-content/uploads/2021/09/Recycled-J-Sad-Summer.jpg", songGenre: "Hip-Hop"),
     Song(songName: "Hospital for Souls", songAuthor: "Bring me the Horizon", songImageUrl: "https://i.scdn.co/image/ab67616d0000b27360cf7c8dd93815ccd6cb4830", songGenre: "Hard Rock"),
     Song(songName: "Sudores Fríos", songAuthor: "Natos y Waor & Recycled J", songImageUrl: "https://natosywaor.com/wp-content/uploads/2021/04/cd-hijos-de-la-ruina-vol-3-1.jpg", songGenre: "Hip-Hop"),
     Song(songName: "Suicide Season", songAuthor: "Bring me the Horizon", songImageUrl: "https://m.media-amazon.com/images/I/51XvDTAGK+L._SY355_.jpg", songGenre: "Hard Rock")]
    
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
        
        return songsCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    @IBSegueAction func segueToDetail(_ coder: NSCoder) -> DetailVC? {
        return DetailVC(coder: coder)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueToDetail"){
            if let goToDetail = segue.destination as? DetailVC {
                goToDetail.songName = music[tableView.indexPathForSelectedRow!.row].getTitle()
                goToDetail.songDesc = music[tableView.indexPathForSelectedRow!.row].getAuthor()
                goToDetail.songImage = music[tableView.indexPathForSelectedRow!.row].getImageUrl()
                goToDetail.songGenre = music[tableView.indexPathForSelectedRow!.row].getGenre()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

