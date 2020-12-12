//
//  PuntoCargaMap.swift
//  Puntos de Recarga
//
//  Created by Borja Martinez Tadeo on 27/09/2019.
//  Copyright © 2019 Borja Martinez Tadeo. All rights reserved.
//

import SwiftUI
import MapKit
import GoogleMobileAds
import SlideOverCard

struct PuntoCargaMap: View {
    @ObservedObject var datas = observer()
    @State var selectedPunto: PuntoCarga? 
    @State private var position = CardPosition.middle
    @State private var background = BackgroundStyle.blur
    var body: some View {
        ZStack{
            FullMapView(puntos: datas.data,selectedPunto:$selectedPunto).edgesIgnoringSafeArea(.all)
        }
        
    }
  

       
    }
    


 /*
 struct PuntoCargaMap_Previews: PreviewProvider {
    var puntos: [PuntoCarga]
     static var previews: some View {
        PuntoCargaMap(puntos: '"#<[PuntoCarga]>"')
     }
 }


 */
