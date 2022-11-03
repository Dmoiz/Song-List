//
//  ViewController.swift
//  Song List
//
//  Created by Diego Moreno on 4/10/22.
//

import UIKit

class MainVC : UITableViewController {
    
    //Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //Data for the table
    var music : [Song] = []
    
    func fetchSong(){
        //Fetch data from Core Data to display in the table
        do{
            //Assign the data to the array
            self.music = try context.fetch(Song.fetchRequest())
            print(self.music)
            //This only ocurrs in the main thread
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        catch {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return music.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let songsCell : SongCell = tableView.dequeueReusableCell(withIdentifier: "songsCell", for: indexPath) as! SongCell
        songsCell.lbSong.text = music[indexPath.row].getSongName()
        songsCell.lbAuthor.text = music[indexPath.row].getSongDesc()

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
                goToDetail.songName = music[tableView.indexPathForSelectedRow!.row].getSongName()
                goToDetail.songDesc = music[tableView.indexPathForSelectedRow!.row].getSongDesc()
                goToDetail.songImage = music[tableView.indexPathForSelectedRow!.row].getImageUrl()
                goToDetail.songGenre = music[tableView.indexPathForSelectedRow!.row].getGenre()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchSong()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSong()
        tableView.delegate = self
        tableView.dataSource = self
    }
}
