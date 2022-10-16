//
//  ImageViewCustom.swift
//  Song List
//
//  Created by Diego Moreno on 13/10/22.
//

import UIKit
//Variable que usaré más adelante para guardar las imagenes en la cache
var imageCache = NSCache<AnyObject, AnyObject>()

class ImageViewCustom : UIImageView{
    //Guardo un objeto que es lo que da la info de la url a la actividad
    var task : URLSessionDataTask!
    let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    func loadImage(from url : URL){
        //Me aseguro de borrar las imagenes de la anterior ejecución de la app
        image = nil
        loadSpinner()
        //Cancela la carga de una imagen cuando desaparece de la tabla
        if let task = task{
            task.cancel()
        }
        //Cargar las inagenes en cache y asegurarse de que no se ejecute más código después del return
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage{
            image = imageFromCache
            removeSpinner()
            return
        }
        //Lo hace todo asíncono
        task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            //Me preparo por si puede dar error
            guard
                let data = data,
                let newImage = UIImage(data : data)
            else {
                print("Couldn't load image from url: \(url)")
                return
            }
            //Guardar las imagenes en cache
            imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
            //Hace la imagen asíncrona y a la vez quito el spinner
            DispatchQueue.main.async{
                self.image = newImage
                self.removeSpinner()
            }
        }
        //Hace todo lo anterior
        task.resume()
    }
    //Creación del spinner
    func loadSpinner(){
        addSubview(spinner)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        spinner.startAnimating()
    }
    //Eliminar el spinner
    func removeSpinner(){
        spinner.removeFromSuperview()
    }
}
