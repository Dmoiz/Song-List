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
                 Song(songName: "Bury the Light", songAuthor: "Devil May Cry V", songImageUrl: "https://m.media-amazon.com/images/I/91AQgKlTZsL._SS500_.jpg")]
    
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
