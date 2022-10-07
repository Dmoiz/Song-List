//
//  ViewController.swift
//  Song List
//
//  Created by Diego Moreno on 4/10/22.
//

import UIKit

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tvView: UITableView!
    
    let music = [Song(songName: "Suicide Season", songAuthor: "Bring me the Horizon", songImageUrl: "https://m.media-amazon.com/images/I/51XvDTAGK+L._SY355_.jpg"),
                 Song(songName: "Tristre", songAuthor: "Recycled J", songImageUrl: "https://www.mondosonoro.com/wp-content/uploads/2021/09/Recycled-J-Sad-Summer.jpg"),
                 Song(songName: "Bury the Light", songAuthor: "Devil May Cry V", songImageUrl: "https://m.media-amazon.com/images/I/91AQgKlTZsL._SS500_.jpg"),
                 Song(songName: "100XRE A TU LADO STARE", songAuthor: "Rojuu", songImageUrl: "https://sonidomuchacho.com/wp-content/uploads/2022/02/ROJUU-Kor_Kor_Lake-1080x1080-portada.jpg"),
                 Song(songName: "A Medias Verdades", songAuthor: "Abhir Hathi", songImageUrl: "https://images.genius.com/6533c9cfc356ab23aaa956fe04609878.1000x1000x1.jpg"),
                Song(songName: "Joker and the Thief", songAuthor: "Wolfmother", songImageUrl: "https://i.scdn.co/image/ab67616d0000b27360add33ad61cb9963e3f78f8")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return music.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let songCell : SongCell = tableView.dequeueReusableCell(withIdentifier: "songsCell", for: indexPath) as! SongCell
        let songName = music[indexPath.row].getTitle()
        songCell.lbSong.text = songName
        let authorName = music[indexPath.row].getSubTitle()
        songCell.lbAuthor.text = authorName
        let url = URL(string : music[indexPath.row].getImageUrl())
        let data = try? Data(contentsOf: url!)
        let photoData : UIImage = UIImage(data: data!)!
        songCell.ivPhoto.image = photoData
        return songCell
    }

    override func viewDidLoad() {
        tvView.dataSource = self
        tvView.delegate = self
        super.viewDidLoad()
        
    }

}
