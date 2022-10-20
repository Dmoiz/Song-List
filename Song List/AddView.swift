//
//  AddView.swift
//  Song List
//
//  Created by Diego Moreno on 18/10/22.
//

import UIKit

class AddView: UIViewController {
    
    @IBOutlet weak var ivUploadImage: ImageViewCustom!
    @IBOutlet weak var lbSongName: UITextField!
    @IBOutlet weak var lbSongDesc: UITextField!
    @IBOutlet weak var pvGenrese: UIPickerView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var textField : String = ""
    var songName : String = ""
    var songDesc : String = ""
    
    var picker : PickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker = PickerView()
        pvGenrese.dataSource = picker
        pvGenrese.delegate = picker
    }
    
    // MARK: - Dialogo para la cámara y galería
    @IBAction func btnImage(_ sender: Any) {
        let alert = UIAlertController(title: "De donde quieres sacar la foto", message: "Cámara, Galería o URL(recomendada)", preferredStyle: .alert)
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
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Confirmar", style: .default, handler: { action in
            self.textField = alert.textFields![0].text!
            //print(self.textField)
            //let url = URL(string: self.textField)
            //self.ivUploadImage.loadImage(from: url!)
//            if let url = URL(string: self.textField){
//                print(url)
//                self.ivUploadImage.loadImage(from: url)
//            }
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
    
    @IBAction func btnAdd(_ sender: Any) {
        //Comprobación de que los campos no estén vacíos
        if !lbSongName.text!.isEmpty && !lbSongDesc.text!.isEmpty{
            //Creación de la canción
            let newSong = Song(context: self.context)
            newSong.songName = lbSongName.text
            newSong.songDesc = lbSongDesc.text
            newSong.songImage = textField
            newSong.songGenre = getGenre()
            //Guardar los datos
            do {
                try self.context.save()
            }
            catch {
                
            }
        } else {
            print("mal")
            let alert = UIAlertController(title: "Algo ha fallado", message: "Comprueba que has rellenado todos los campos", preferredStyle: .alert)
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
    }
    
    func getGenre() -> String {
        switch (pvGenrese.selectedRow(inComponent: 0)) {
        case 0:
            return "Pop"
        case 1:
            return "Hip-Hop"
        case 2:
            return "Rap"
        case 3:
            return "Hard Rock"
        case 4:
            return "Música Latina"
        case 5:
            return "R&B/Soul"
        case 6:
            return "Metal"
        default:
            return ""
        }
    }
    
    func passUrlToImage (urlData : String) -> UIImage{
        let url = URL(string: urlData)
        let data = try? Data(contentsOf: url!)
        let loadImage : UIImage = UIImage(data: data!)!
        return loadImage
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

extension AddView {
    func toBase64(word: String) -> String{
        let base64Encode = word.data(using: String.Encoding.utf8)!.base64EncodedString()
        
        return base64Encode
    }
    
    func fromBase64(word: String) -> String {
        let base64Decoded = Data(base64Encoded: word)!
        let decodedString = String(data: base64Decoded, encoding: .utf8)!
        
        return decodedString
    }
}
