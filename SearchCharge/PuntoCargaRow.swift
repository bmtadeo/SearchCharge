//
//  s.swift
//  Puntos de Recarga
//
//  Created by Borja Martinez Tadeo on 27/09/2019.
//  Copyright © 2019 Borja Martinez Tadeo. All rights reserved.
//

import SwiftUI

struct PuntoCargaRow: View {
    var punto: PuntoCarga
    var body: some View {
         HStack {
              if punto.charger == "Supercharger" && punto.status == "Funcionamiento" {
                  Image("supercharger64")
                  .resizable()
                  .frame(width: 40, height: 40)
              }else if punto.charger == "Tesla Destination Charging" && punto.status == "Funcionamiento" {
                  Image("tesladc")
                  .resizable()
                  .frame(width: 33, height: 50)
              }else if punto.charger == "Ibil" && punto.status == "Funcionamiento" {
                  Image("ibil64")
                  .resizable()
                  .frame(width: 40, height: 40)
              }else if punto.charger == "Iberdrola" && punto.status == "Funcionamiento" {
                  Image("iberdrola64")
                  .resizable()
                  .frame(width: 40, height: 40)
              }else if punto.charger == "Easy Charger" && punto.status == "Funcionamiento" {
                  Image("easycharger64")
                  .resizable()
                  .frame(width: 40, height: 40)
              }else if punto.charger == "Ionity" && punto.status == "Funcionamiento" {
                  Image("ionity64")
                  .resizable()
                  .frame(width: 40, height: 40)
              }else if punto.charger == "Endesa" && punto.status == "Funcionamiento" {
                  Image("endesa64")
                  .resizable()
                  .frame(width: 40, height: 40)
              }else if punto.charger == "Polar Network" && punto.status == "Funcionamiento" {
                  Image("polar64")
                  .resizable()
                  .frame(width: 40, height: 40)
              }else{
                if punto.charger == "Supercharger" && (punto.status == "Construccion" || punto.status == "Mantenimiento" ){
                    Image("cone64")
                    .resizable()
                    .frame(width: 40, height: 40)
                }else if punto.charger == "Tesla Destination Charging" && (punto.status == "Construccion" || punto.status == "Mantenimiento" ){
                    Image("cone64")
                    .resizable()
                    .frame(width: 40, height: 40)
                }else if punto.charger == "Ibil" && (punto.status == "Construccion" || punto.status == "Mantenimiento" ){
                    Image("cone64")
                    .resizable()
                    .frame(width: 40, height: 40)
                }else if punto.charger == "Iberdrola" && (punto.status == "Construccion" || punto.status == "Mantenimiento" ){
                    Image("cone64")
                    .resizable()
                    .frame(width: 40, height: 40)
                }else if punto.charger == "Easy Charger" && (punto.status == "Construccion" || punto.status == "Mantenimiento" ){
                    Image("cone64")
                    .resizable()
                    .frame(width: 40, height: 40)
                }else if punto.charger == "Ionity" && (punto.status == "Construccion" || punto.status == "Mantenimiento" ){
                    Image("cone64")
                    .resizable()
                    .frame(width: 40, height: 40)
                }else if punto.charger == "Endesa" && (punto.status == "Construccion" || punto.status == "Mantenimiento" ){
                    Image("cone64")
                    .resizable()
                    .frame(width: 40, height: 40)
                }else if punto.charger == "Polar Network" && (punto.status == "Construccion" || punto.status == "Mantenimiento" ){
                    Image("cone64")
                    .resizable()
                    .frame(width: 40, height: 40)
                }
            }
             VStack(alignment: .leading){
                 Text(punto.name)
                 Text("\(punto.charger)").font(.subheadline).foregroundColor(.secondary)
                 
             }
             
         }
         
    }
}
/*

 struct s_Previews: PreviewProvider {
     static var previews: some View {
         s()
     }
 }
 */
