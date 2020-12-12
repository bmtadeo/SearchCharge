//
//  ContentView.swift
//  Puntos de Recarga
//
//  Created by Borja Martinez Tadeo on 27/09/2019.
//  Copyright © 2019 Borja Martinez Tadeo. All rights reserved.
//

import SwiftUI
//import GoogleMobileAds
import FirebaseDatabase

struct PuntoCargaList: View {
    @State var text = ""
    //let puntoCargaData : [PuntoCarga] = leerDatabase()
    var body: some View {
        NavigationView{
            List{
                ForEach(leerDatabase(), id: \.self){ punto in
                        NavigationLink(destination: PuntoCargaDetail(punto: punto)) {
                            PuntoCargaRow(punto: punto)
                        }
                }
            }
            .navigationBarTitle(Text("Buscar"))
        }
        
    }
    func leerDatabase()->[PuntoCarga]{
        var puntos =  [PuntoCarga]()
        let ref = Database.database().reference()
        ref.child("puntos").observeSingleEvent(of: .value) { (snapshot) in
            let number = snapshot.childrenCount
            for index in 0...number-1 {
               var address : String = ""
               var charger: String = ""
               var city: String = ""
               var cost: Double = 0.0
               var country: String = ""
               var hours: String = ""
               var id: Int = 0
               var name: String = ""
               var power: String = ""
               var puestos: Int = 0
               var url: String = ""
               var ccs: Int = 0
               var type2: Int = 0
               var chademo: Int = 0
               var schuko: Int = 0
               var longitude: Double = 0.0
               var latitude: Double = 0.0
                    ref.child("puntos/\(index)/address").observeSingleEvent(of: .value) { (snapshot1) in
                        address = snapshot1.value as! String
                        print(snapshot1.value as! String)
                    }
                    ref.child("puntos/\(index)/charger").observeSingleEvent(of: .value) { (snapshot2) in
                         charger = snapshot2.value as! String
                         print(snapshot2.value as! String )
                     }
                    ref.child("puntos/\(index)/city").observeSingleEvent(of: .value) { (snapshot3) in
                        city = snapshot3.value as! String
                        print(snapshot3.value as! String)
                    }
                    ref.child("puntos/\(index)/cost").observeSingleEvent(of: .value) { (snapshot4) in
                        cost = snapshot4.value as! Double
                        print(snapshot4.value as! Double)
                    }
                    ref.child("puntos/\(index)/country").observeSingleEvent(of: .value) { (snapshot5) in
                        country = snapshot5.value as! String
                        print(snapshot5.value as! String)
                    }
                    ref.child("puntos/\(index)/hours").observeSingleEvent(of: .value) { (snapshot6) in
                        hours = snapshot6.value as! String
                        print(snapshot6.value as! String)
                    }
                    ref.child("puntos/\(index)/id").observeSingleEvent(of: .value) { (snapshot7) in
                        id = snapshot7.value as! Int
                        print(snapshot7.value as! Int)
                    }
                    ref.child("puntos/\(index)/name").observeSingleEvent(of: .value) { (snapshot8) in
                        name = snapshot8.value as! String
                        print(snapshot8.value as! String)
                    }
                    ref.child("puntos/\(index)/power").observeSingleEvent(of: .value) { (snapshot9) in
                        power = snapshot9.value as! String
                        print(snapshot9.value as! String)
                    }
                    ref.child("puntos/\(index)/puestos").observeSingleEvent(of: .value) { (snapshot10) in
                        puestos = snapshot10.value as! Int
                        print(snapshot10.value as! Int)
                    }
                    ref.child("puntos/\(index)/url").observeSingleEvent(of: .value) { (snapshot11) in
                        url = snapshot11.value as! String
                        print(snapshot11.value as! String )
                    }
                    ref.child("puntos/\(index)/conectors/ccs").observeSingleEvent(of: .value) { (snapshot12) in
                        print(snapshot12.key)
                        ccs = snapshot12.value as! Int
                        print(snapshot12.value as! Int)
                    }
                    ref.child("puntos/\(index)/conectors/type2").observeSingleEvent(of: .value) { (snapshot13) in
                        print(snapshot13.key)
                        type2 = snapshot13.value as! Int
                        print(snapshot13.value as! Int)
                    }
                    ref.child("puntos/\(index)/conectors/chademo").observeSingleEvent(of: .value) { (snapshot14) in
                        print(snapshot14.key)
                        chademo = snapshot14.value as! Int
                        print(snapshot14.value as! Int)
                    }
                    ref.child("puntos/\(index)/conectors/schuko").observeSingleEvent(of: .value) { (snapshot15) in
                        print(snapshot15.key)
                        schuko = snapshot15.value as! Int
                        print(snapshot15.value as! Int)
                   }
                    ref.child("puntos/\(index)/coordinates/longitude").observeSingleEvent(of: .value) { (snapshot16) in
                        print(snapshot16.key)
                        longitude = snapshot16.value as! Double
                        print(snapshot16.value as! Double)
                    }
                    ref.child("puntos/\(index)/coordinates/latitude").observeSingleEvent(of: .value) { (snapshot17) in
                        print(snapshot17.key)
                        latitude = snapshot17.value as! Double
                        print(snapshot17.value as! Double)
                    }
               let conectors : Conectors = Conectors(ccs: ccs, type2: type2, chademo: chademo, schuko: schuko)
               let coordinates: Coordinates =  Coordinates(latitude: latitude, longitude: longitude)
               let punto: PuntoCarga = PuntoCarga(id: id, name: name, address: address, country: country, city: city, charger: charger, url: url, coordinates: coordinates, puestos: puestos, cost: cost, power: power, hours: hours, conectors: conectors)
               puntos.append(punto)
               for punto in puntos{
                   print(punto.name)
               }
            }
           
        }
       return puntos

}

}

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         PuntoCargaList()
     }
 }

