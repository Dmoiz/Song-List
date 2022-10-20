//
//  PickerView.swift
//  Song List
//
//  Created by Diego Moreno on 18/10/22.
//

import UIKit

class PickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {

    let musicGenre = ["Pop", "Hip-Hop", "Rap", "Hard Rock", "Música Latina", "R&B/Soul", "Metal"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return musicGenre.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return musicGenre[row]
    }
}
