//
//  PuntoCarga.swift
//  Puntos de Recarga
//
//  Created by Borja Martinez Tadeo on 27/09/2019.
//  Copyright © 2019 Borja Martinez Tadeo. All rights reserved.
//

import SwiftUI
import Combine
import CoreLocation

struct PuntoCarga: Hashable, Identifiable, Codable{
      var id: Int
      var name: String
      var address: String
      var country: String
      var city: String
      var charger: String
      var url : String
      fileprivate var coordinates: Coordinates
      var puestos: Int
      var cost: Double
      var power: String
      var hours: String
      var status: String
      var conectors: Conectors
      
      var locationCoordinate: CLLocationCoordinate2D {
          CLLocationCoordinate2D(
              latitude: coordinates.latitude,
              longitude: coordinates.longitude)
      }
    init (id: Int, name: String, address: String, country: String, city: String, charger: String, url: String,coordinates: Coordinates, puestos: Int, cost:Double, power:String, status: String, hours:String, conectors:Conectors){
      self.id = id
      self.name = name
      self.address = address
      self.country = country
      self.city = city
      self.charger = charger
      self.url = url
      self.coordinates = coordinates
      self.puestos=puestos
      self.cost = cost
      self.power = power
      self.status = status
      self.hours = hours
      self.conectors = conectors
    }
 }
  struct Coordinates: Hashable, Codable {
      var latitude: Double
      var longitude: Double
      init (latitude: Double, longitude: Double){
        self.latitude = latitude
        self.longitude = longitude
      }
  }
  struct Conectors: Hashable, Codable {
      var ccs: Int
      var type2: Int
      var chademo: Int
      var schuko: Int
    
    init (ccs: Int, type2: Int, chademo: Int, schuko: Int){
        self.ccs = ccs
        self.type2 = type2
        self.chademo = chademo
        self.schuko = schuko
      }
  }

