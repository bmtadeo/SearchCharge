//
//  FirebaseData.swift
//  SearchCharge
//
//  Created by Borja Martinez Tadeo on 09/10/2019.
//  Copyright © 2019 Borja Martinez Tadeo. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
import CoreLocation
import FirebaseDatabase

var puntoCargaData : [PuntoCarga] = leer()

func leer()->[PuntoCarga]{
    let ref = Database.database().reference().child("puntos")
    ref.observe(DataEventType.value, with: { (snapshot) in
        
        //if the reference have some values
        if snapshot.childrenCount > 0 {
            //clearing the list
            puntoCargaData.removeAll()
            //iterating through all the values
            for puntos in snapshot.children.allObjects as! [DataSnapshot] {
                //getting values
                let puntoObject = puntos.value as? [String: AnyObject]
                let puntoName  = puntoObject?["name"]
                let puntoId  = puntoObject?["id"]
                let puntoAddress = puntoObject?["address"]
                let puntoCharger = puntoObject?["charger"]
                let puntoCity = puntoObject?["city"]
                let puntoCost = puntoObject?["cost"]
                let puntoCountry = puntoObject?["country"]
                let puntoHours = puntoObject?["hours"]
                let puntoPower = puntoObject?["power"]
                let puntoPuestos = puntoObject?["puestos"]
                let puntoUrl = puntoObject?["url"]
                let coordenadas = puntoObject!["coordinates"]
                let latitude = coordenadas!["latitude"]
                let longitude = coordenadas!["longitude"]
                let conectors = puntoObject!["conectors"]
                let ccs = conectors!["ccs"]
                let type2 = conectors!["type2"]
                let chademo = conectors!["chademo"]
                let schuko = conectors!["schuko"]
                let coord = Coordinates(latitude: latitude!! as! Double , longitude: longitude!! as! Double)
                let con = Conectors(ccs: ccs as! Int, type2: type2 as! Int, chademo: chademo as! Int, schuko: schuko as! Int)
                let puntoCarga = PuntoCarga(id: puntoId as! Int, name: puntoName as! String, address: puntoAddress as! String, country: puntoCountry as! String, city: puntoCity as! String, charger: puntoCharger as! String, url: puntoUrl as! String, coordinates: coord, puestos: puntoPuestos as! Int, cost: puntoCost as! Double, power: puntoPower as! String, hours: puntoHours as! String, conectors: con)
                puntoCargaData.append(puntoCarga)
            }

        }
    })
    for punto in puntoCargaData{
        print(punto)
    }
    return puntoCargaData
}




        



    
