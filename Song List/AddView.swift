//
//  AddView.swift
//  Song List
//
//  Created by Diego Moreno on 18/10/22.
//

import UIKit

class AddView: UIViewController {
    
    @IBOutlet weak var ivUploadImage: UIImageView!
    @IBOutlet weak var lbSongName: UITextField!
    @IBOutlet weak var lbSongDesc: UITextField!
    @IBOutlet weak var pvGenrese: UIPickerView!
    
    var songName : String = ""
    var songDesc : String = ""
    
    var picker : PickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbSongName.text = songName
        lbSongDesc.text = songDesc
        
        picker = PickerView()
        pvGenrese.dataSource = picker
        pvGenrese.delegate = picker
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        if songName.isEmpty {
            print("muere")
        } else {
            print("Navego y añado")
        }
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

