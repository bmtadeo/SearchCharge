//
//  Ayuda.swift
//  SearchCharge
//
//  Created by Borja Martinez Tadeo on 13/11/2019.
//  Copyright © 2019 Borja Martinez Tadeo. All rights reserved.
//

import SwiftUI
import GoogleMobileAds
struct AyudaView: View {
    @State private var showShareSheet = false
    @State var interstitial : GADInterstitial!
    var body: some View{
        NavigationView{
            List{
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "1.circle.fill")
                        Text("¿Cómo puedo añadir un nuevo punto de recarga?")
                    }
                    Text("En el menú Buscar, pulsando en el simbolo +, accedes al menú para añadir un punto de recarga.")
                }
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "2.circle.fill")
                        Text("¿Como puedo editar un punto de recarga?")
                    }
                    Text("De momento no se pueden editar puntos de recarga. Estamos trabajando en ello. Puedes contactar con el e-mail de la sección de Contacto para resolver tus dudas.")
                }
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "3.circle.fill")
                        Text("Un punto de recarga muestra informacion erronea, ¿Como puedo avisar del error?")
                    }
                    Text("Puedes contactar con el desarrrollador con el e-mail que esta en la sección de Contacto.")
                }
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "4.circle.fill")
                        Text("¿Puedo añadir nuevos operadores a la aplicación?")
                    }
                    Text("Para añadir nuevos operadores, por favor, contacta al desarrollador a través del e-mail que esta en la sección de Contacto.")
                }
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "4.circle.fill")
                        Text("Me gustaria añadir un nuevo tipo de conector, ¿Puedo añadir un nuevo conector a la aplicación?")
                    }
                    Text("Para añadir nuevos operadores, por favor, contacta al desarrollador a través del e-mail que esta en la sección de Contacto.")
                }
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "5.circle.fill")
                        Text("¿Cómo me puedo poner en contacto con el desarrollador?")
                    }
                    Text("A través del email que se encuentra en la sección de Contacto.")
                }
            }
               .navigationBarTitle(Text("Ayuda"))
            .navigationBarItems(trailing: Button(action: {
                self.showShareSheet = true
                self.interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/1033173712")
                let req = GADRequest()
                self.interstitial.load(req)
            }) {
                Image(systemName: "square.and.arrow.up").font(.title)
            }
            )
            
           }.sheet(isPresented: $showShareSheet) {
               ShareSheetView(activityItems: ["Valoranos en el App Store y comparte la aplicación con tus amigos. \nDanos un like en Facebook: fb.me/SearchCharge\nSiguenos en Instagram: https://www.instagram.com/searchchargeapp/"])
           }
        
    }
   
}

/*
 struct Ayuda_Previews: PreviewProvider {
     static var previews: some View {
         Ayuda()
     }
 }
 */
