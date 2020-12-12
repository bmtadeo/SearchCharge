//
//  PuntoCargaDetail.swift
//  Puntos de Recarga
//
//  Created by Borja Martinez Tadeo on 27/09/2019.
//  Copyright © 2019 Borja Martinez Tadeo. All rights reserved.
//

import SwiftUI
import MapKit
import UIKit
import GoogleMobileAds

struct PuntoCargaDetail: View {
    var punto: PuntoCarga
    @State private var showShareSheet = false
    @State var interstitial : GADInterstitial!
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    //var interstitia: Interstitial!
    var body: some View {
        VStack{
            MapView(coordinate: punto.locationCoordinate, punto:punto)
            .edgesIgnoringSafeArea(.top)
            .frame(height: 200)
            VStack(alignment: .leading) {
                HStack{
                    if punto.charger == "Supercharger" && punto.status == "Funcionamiento" {
                        Image("supercharger64")
                        .resizable()
                        .frame(width: 25, height: 25)
                    }else if punto.charger == "Tesla Destination Charging" && punto.status == "Funcionamiento"{
                        Image("tesladc")
                        .resizable()
                        .frame(width: 15, height: 25)
                    }else if punto.charger == "Ibil" && punto.status == "Funcionamiento"{
                        Image("ibil64")
                        .resizable()
                        .frame(width: 25, height: 25)
                    }else if punto.charger == "Iberdrola" && punto.status == "Funcionamiento"{
                        Image("iberdrola64")
                        .resizable()
                        .frame(width: 25, height: 25)
                    }else if punto.charger == "EasyCharger" && punto.status == "Funcionamiento"{
                        Image("easycharger64")
                        .resizable()
                        .frame(width: 25, height: 25)
                    }else if punto.charger == "Ionity" && punto.status == "Funcionamiento"{
                        Image("ionity64")
                        .resizable()
                        .frame(width: 25, height: 25)
                    }else if punto.charger == "Endesa" && punto.status == "Funcionamiento"{
                        Image("endesa64")
                        .resizable()
                        .frame(width: 25, height: 25)
                    }else if punto.charger == "Polar Network" && punto.status == "Funcionamiento"{
                        Image("endesa64")
                        .resizable()
                        .frame(width: 25, height: 25)
                    }else{
                        if punto.charger == "Supercharger" && (punto.status == "Construccion" || punto.status == "Mantenimiento" ){
                            Image("cone64")
                            .resizable()
                            .frame(width: 25, height: 25)
                        }else if punto.charger == "Tesla Destination Charging" && (punto.status == "Construccion" || punto.status == "Mantenimiento" ){
                            Image("cone64")
                            .resizable()
                            .frame(width: 25, height: 25)
                        }else if punto.charger == "Ibil" && (punto.status == "Construccion" || punto.status == "Mantenimiento" ){
                            Image("cone64")
                            .resizable()
                            .frame(width: 25, height: 25)
                        }else if punto.charger == "Iberdrola" && (punto.status == "Construccion" || punto.status == "Mantenimiento" ){
                            Image("cone64")
                            .resizable()
                            .frame(width: 25, height: 25)
                        }else if punto.charger == "EasyCharger" && (punto.status == "Construccion" || punto.status == "Mantenimiento" ){
                            Image("cone64")
                            .resizable()
                            .frame(width: 25, height: 25)
                        }else if punto.charger == "Ionity" && (punto.status == "Construccion" || punto.status == "Mantenimiento" ){
                            Image("cone64")
                            .resizable()
                            .frame(width: 25, height: 25)
                        }else if punto.charger == "Endesa" && (punto.status == "Construccion" || punto.status == "Mantenimiento" ){
                            Image("cone64")
                            .resizable()
                            .frame(width: 25, height: 25)
                        }else if punto.charger == "Polar Network" && (punto.status == "Construccion" || punto.status == "Mantenimiento" ){
                            Image("cone64")
                            .resizable()
                            .frame(width: 25, height: 25)
                        }
                        
                    }
                    Text(punto.name)
                        .font(.subheadline)
                        .bold()
                    
                }
                HStack(alignment: .top) {
                    Text("Dirección: \(punto.address)")
                        .font(.subheadline)
                }
                HStack(alignment: .top) {
                    Text("Operador:").font(.subheadline)
                    Button(action: abrirURL){
                        Text("\(punto.charger)").font(.body)
                        
                    }
                }
                HStack(alignment: .top) {
                    if punto.status == "Construccion"{
                        Text("Estado: Construcción")
                        .font(.subheadline)
                    }else{
                        Text("Estado: \(punto.status)")
                        .font(.subheadline)
                    }
                
                    Spacer()
                }
                HStack(alignment: .top) {
                    Text("Número de puestos: \(punto.puestos)")
                        .font(.subheadline)
                    Spacer()
                }
                HStack(alignment: .top) {
                    Text("Potencia: \(punto.power)")
                        .font(.subheadline)
                    Spacer()
                }
                HStack(alignment: .top) {
                    if punto.charger == "Ionity"{
                        Text("Tarifa por sesión: \(punto.cost.removeZerosFromEnd()) €")
                        .font(.subheadline)
                    }else{
                        if punto.country == "Denmark"{
                            Text("Tarifa por sesión: \(punto.cost.removeZerosFromEnd()) kr/kWh")
                            .font(.subheadline)
                        }else if punto.country == "Switzerland"{
                            Text("Tarifa por sesión: \(punto.cost.removeZerosFromEnd()) CHF/kWh")
                            .font(.subheadline)
                        }else if punto.country == "United Kingdom"{
                            Text("Tarifa por sesión: \(punto.cost.removeZerosFromEnd()) £/kWh")
                            .font(.subheadline)
                        }else if punto.country == "Poland"{
                            Text("Tarifa por sesión: \(punto.cost.removeZerosFromEnd()) PLN/kWh")
                            .font(.subheadline)
                        }else if punto.country == "Hungary"{
                            Text("Tarifa por sesión: \(punto.cost.removeZerosFromEnd()) HUF/kWh")
                            .font(.subheadline)
                        }else if punto.country == "Czech Republic"{
                            Text("Tarifa por sesión: \(punto.cost.removeZerosFromEnd()) CZK/kWh")
                            .font(.subheadline)
                        }else if punto.country == "Norway"{
                            Text("Tarifa por sesión: \(punto.cost.removeZerosFromEnd()) kr/kWh")
                            .font(.subheadline)
                        }else if punto.country == "Sweden"{
                            Text("Tarifa por sesión: \(punto.cost.removeZerosFromEnd()) SEK/kWh")
                            .font(.subheadline)
                        }else{
                            Text("Precio del kWh: \(punto.cost.removeZerosFromEnd()) €/kWh")
                            .font(.subheadline)
                        }
                    }
                    Spacer()
                }
                HStack(alignment: .top) {
                    VStack(alignment:.leading){
                        HStack{
                            Image(colorScheme == .light ? "css_dark" : "css_light").resizable()
                            .frame(width: 25, height: 25).aspectRatio(contentMode: .fit)
                            Text("CCS Combo: \(punto.conectors.ccs)").font(.subheadline)
                        }
                        HStack{
                            Image(colorScheme == .light ? "type2_dark" : "type2_light").resizable()
                            .frame(width: 25, height: 25).aspectRatio(contentMode: .fit)
                            Text("Type 2: \(punto.conectors.type2)").font(.subheadline)
                        }
                        HStack{
                            Image(colorScheme == .light ? "chademo_dark" : "chademo_light").resizable()
                            .frame(width: 25, height: 25).aspectRatio(contentMode: .fit)
                            Text("CHAdeMO: \(punto.conectors.chademo)").font(.subheadline)
                        }
                        HStack{
                            Image(colorScheme == .light ? "schuko_dark" : "schuko_light").resizable()
                            .frame(width: 25, height: 25).aspectRatio(contentMode: .fit)
                            Text("Schuko: \(punto.conectors.schuko)").font(.subheadline)
                        }
                    }
                     

                   
                }
                HStack{
                     Button(action: {
                        if self.interstitial.isReady{
                              let root = UIApplication.shared.windows.first?.rootViewController
                              self.interstitial.present(fromRootViewController: root!)
                        }
                        let lat1 = self.punto.locationCoordinate.latitude
                        let lng1 = self.punto.locationCoordinate.longitude

                         let latitude =  lat1
                         let longitude =  lng1

                         let regionDistance:CLLocationDistance = 10000
                         let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
                         let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
                         let options = [
                             MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                             MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
                         ]
                         let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
                         let mapItem = MKMapItem(placemark: placemark)
                         mapItem.name = self.punto.address
                         mapItem.openInMaps(launchOptions: options)
                     }){
                         HStack{
                             Image(systemName: "map")
                             Text("Abrir en Mapas.").bold()
                         }
                     }.onAppear{
                     self.interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/1033173712")
                     let req = GADRequest()
                     self.interstitial.load(req)
                      }
                     
                        /*
                     Button(action: openMapForPlace){
                             HStack{
                                 Image(systemName: "map")
                                 Text("Abrir en Mapas.").bold().font(.subheadline)
                             }
                     }
                     */
                    
                }
                 VStack(alignment: .center) {
                     HStack{
                        Spacer()
                         GADBannerViewController()
                             .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                         Spacer()
                     }
                 }
            }
            .padding()
            Spacer()
        }
        .navigationBarTitle(Text(verbatim: punto.name), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showShareSheet = true
            /*
             if self.interstitial.isReady{
                 let root = UIApplication.shared.windows.first?.rootViewController
                 self.interstitial.present(fromRootViewController: root!)
                 
             }else{
                 print("Not ready")
             }
             */
        }) {
            Image(systemName: "square.and.arrow.up").font(.title)
        }
        /*
             .onAppear{
                self.interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/1033173712")
                let req = GADRequest()
                self.interstitial.load(req)
             }
             */
        )
        .sheet(isPresented: $showShareSheet) {
            ShareSheetView(activityItems: ["Punto de carga de \(self.punto.name) en la dirección: \(self.punto.address) en \(self.punto.city) del operador \(self.punto.charger).\nMás información de este punto de carga y otros puntos de carga en la app SearchCharge.\nDanos un like en Facebook: fb.me/SearchCharge\nSiguenos en Instagram: https://www.instagram.com/searchchargeapp/"])
        }
        }
    
    func abrirURL(){
        if let url = URL(string: punto.url) {
            UIApplication.shared.open(url)
        }
    }
    func openMapForPlace() {

        let lat1 = punto.locationCoordinate.latitude
        let lng1 = punto.locationCoordinate.longitude

        let latitude =  lat1
        let longitude =  lng1

        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = punto.address
        mapItem.openInMaps(launchOptions: options)

    }

    }
extension Float {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}
/*
 struct PuntoCargaDetail_Previews: PreviewProvider {
    var punto: PuntoCarga
     static var previews: some View {
        PuntoCargaDetail(punto: punto)
     }
 }
*/

