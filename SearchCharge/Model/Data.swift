//
//  Data.swift
//  Puntos de Recarga
//
//  Created by Borja Martinez Tadeo on 27/09/2019.
//  Copyright © 2019 Borja Martinez Tadeo. All rights reserved.
//

import SwiftUI
import Firebase
import Firebase

class observer: ObservableObject{
    @Published var data = [PuntoCarga]()
    
    init(){
        let db = Firestore.firestore().collection("puntos")
        db.addSnapshotListener{ (snap,err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documents{
                let dataConnect = i.get("conectors") as? [String: Any]
                let dataCoord =  i.get("coordinates")  as? [String: Any]
                let connect = Conectors(ccs: dataConnect?["ccs"] as? Int ?? 0, type2: dataConnect?["type2"] as? Int ?? 0, chademo: dataConnect?["chademo"]  as? Int ?? 0, schuko: dataConnect?["schuko"] as? Int ?? 0)
                let coord = Coordinates(latitude: dataCoord?["latitude"] as? Double ?? 0.0, longitude: dataCoord?["longitude"] as? Double ?? 0.0)
                let punto = PuntoCarga(id: i.get("id") as! Int, name: i.get("name") as! String, address: i.get("address") as! String, country: i.get("country") as! String, city: i.get("city") as! String, charger: i.get("charger") as! String, url: i.get("url") as! String, coordinates: coord, puestos: i.get("puestos") as! Int, cost: i.get("cost") as! Double, power: i.get("power") as! String, status:i.get("status") as! String, hours: i.get("hours") as! String, conectors: connect)
                self.data.append(punto)
            }
        }
    }
}
/*
 import SwiftUI
 import UIKit
 import CoreLocation

 let puntosDeRecarga: [PuntoCarga] = load("puntos.json")

 func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
     let data: Data
     
     guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
         else {
             fatalError("Couldn't find \(filename) in main bundle.")
     }
     
     do {
         data = try Data(contentsOf: file)
     } catch {
         fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
     }
     
     do {
         let decoder = JSONDecoder()
         return try decoder.decode(T.self, from: data)
     } catch {
         fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
     }
 }
 */

/*
 final class ImageStore {
     typealias _ImageDictionary = [String: CGImage]
     fileprivate var images: _ImageDictionary = [:]

     fileprivate static var scale = 2
     
     static var shared = ImageStore()
     
     func image(name: String) -> Image {
         let index = _guaranteeImage(name: name)
         
         return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(verbatim: name))
     }

     static func loadImage(name: String) -> CGImage {
         guard
             let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
             let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
             let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
         else {
             fatalError("Couldn't load image \(name).jpg from main bundle.")
         }
         return image
     }
     
     fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
         if let index = images.index(forKey: name) { return index }
         
         images[name] = ImageStore.loadImage(name: name)
         return images.index(forKey: name)!
     }
 }

 */
