//
//  RouteView.swift
//  
//
//  Created by Borja Martinez Tadeo on 29/11/2019.
//

import SwiftUI

struct RouteView: View {
    @State private var inicio = ""
    @State private var destino = ""
    @State private var pausas = 0
    @State private var modelo = ""
    @State private var modelos = ["Hyundai Ioniq","Hyundai Kona","Audi e-tron quattro","Tesla Model 3 LR", "Tesla Model 3 SR", "Tesla Model 3 Performance", "Tesla Model S 100D", "Tesla Model S 75D"]
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Dirección")){
                    TextField("Inicio", text: $inicio)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(5.0)
                    TextField("Destino", text: $destino)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(5.0)
                    Stepper("Pausas para cargar: \(pausas)", value: $pausas, in: 0...10)
                }
                Section(header: Text("Marca")){
                    Picker(selection: $modelo, label: Text("Modelo")) {
                        ForEach(0 ..< modelos.count) {
                            Text(self.modelos[$0]).tag(0)
                        }
                        .navigationBarTitle("Marca")
                    }
                }
            }
            .navigationBarTitle(Text("Ruta"))
        }
    }
}

/*
 struct RouteView_Previews: PreviewProvider {
     static var previews: some View {
         RouteView()
     }
 }
 */
