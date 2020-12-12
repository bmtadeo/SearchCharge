//
//  MenuPrincipalView.swift
//  Puntos de Recarga
//
//  Created by Borja Martinez Tadeo on 29/09/2019.
//  Copyright © 2019 Borja Martinez Tadeo. All rights reserved.
//

import SwiftUI
import UIKit
import Combine
import Firebase

struct MenuPrincipalView: View {
    @State var selectedView = 1
    
    var body: some View {
        TabView (selection: $selectedView) {
            CategoriaOperadorView()
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Buscar")
            }.tag(1)
            PuntoCargaMap()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Mapa")
            }.tag(2)
            
             
            AyudaView()
                .tabItem {
                    Image(systemName: "questionmark.circle.fill")
                    Text("Ayuda")
            }.tag(3)
            }
        .font(.headline)
        .edgesIgnoringSafeArea(.top)
    }
}


/*
 struct MenuPrincipalView_Previews: PreviewProvider {
     static var previews: some View {
         MenuPrincipalView()
     }
 }
 */

