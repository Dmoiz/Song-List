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
        
    }
    
    // MARK: - Dialogo para la cámara y galería
    @IBAction func btnImage(_ sender: Any) {
        let alert = UIAlertController(title: "De donde quieres sacar la foto", message: "Cámara o Galería", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cámara", style: .default, handler: { action in
            switch action.style{
            case .default:
                let takePhoto = UIImagePickerController()
                takePhoto.delegate = self
                takePhoto.sourceType = .camera
                takePhoto.isEditing = true
                self.present(takePhoto, animated: true)
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            default:
                return
            }
        }))
        alert.addAction(UIAlertAction(title: "Galería", style: .default, handler: { action in
            switch action.style{
            case .default:
                let uploadPhoto = UIImagePickerController()
                uploadPhoto.delegate = self
                uploadPhoto.sourceType = .photoLibrary
                uploadPhoto.isEditing = true
                self.present(uploadPhoto, animated: true)
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            default:
                return
            }
        }))
        alert.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("todo ok")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            default:
                return
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    // MARK: - Fin del diálogo
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension AddView : UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker : UIImagePickerController){
        picker.dismiss(animated: true)
    }
    func imagePickerController(_ picker : UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
        
        let key = UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)
        
        if let image = info[key] as? UIImage{
            print(image)
            self.ivUploadImage.image = image
            picker.dismiss(animated: true)
        }
    }
    
}
