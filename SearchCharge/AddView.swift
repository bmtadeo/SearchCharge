//
//  AddSheetView.swift
//  SearchCharge
//
//  Created by Borja Martinez Tadeo on 04/11/2019.
//  Copyright © 2019 Borja Martinez Tadeo. All rights reserved.
//

import SwiftUI
import GoogleMobileAds
import CoreLocation
import Firebase

struct AddView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var name = ""
    @State private var direccion = ""
    @State private var ciudad = ""
    var paises = ["Andorra","Belgium","Denmark","France","Germany","Italy","Nederlands","Portugal","Spain","Switzerland","Portugal","United Kingdom"]
    var operadores = ["Supercharger","Tesla Destination Charging","Ionity","Iberdrola","Easy Charger","Ibil","Endesa", "Polar Network", "Otros"]
    @State private var pais = 0
    @State private var operador = 0
    @State private var url = ""
    @State private var horario = ""
    @State private var puestos = ""
    @State private var cost = ""
    @State private var ccs = ""
    @State private var type2 = ""
    @State private var chademo = ""
    @State private var schuko = ""
    @State private var rango = ""
    var estados = ["Funcionamiento","Construccion","Mantenimiento"]
    @State private var estado = 0
    @State private var showingAlert = false
    @State private var activeAlert: ActiveAlert = .first
    @State var value : CGFloat = -50
    @ObservedObject var datas = observer()
    
    
    var body: some View {
        NavigationView{
            List{
                //Lugar
                Section(header: Text("Lugar")) {
                        VStack(alignment: .leading) {
                            Text("Nombre")
                            TextField("Nombre del punto de recarga", text: $name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .cornerRadius(5.0)
                            .padding(.horizontal, 15)
                        }
                        VStack(alignment: .leading) {
                            Text("Dirección")
                            TextField("Dirección del punto de recarga", text: $direccion)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .cornerRadius(5.0)
                            .padding(.horizontal, 15)
                        }
                        VStack(alignment: .leading) {
                            Text("Ciudad")
                            TextField("Ciudad del punto de recarga", text: $ciudad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .cornerRadius(5.0)
                            .padding(.horizontal, 15)
                        }
                        VStack(alignment: .leading) {
                            Text("País")
                            Section{
                                Picker(selection: $pais, label:EmptyView()) {
                                    ForEach(0 ..< paises.count) {
                                        Text(self.paises[$0]).tag($0)
                                    }
                                }
                            }
                        }
                }
                //Caracteristicas
                Section(header: Text("Características")){
                    VStack(alignment: .leading) {
                        Text("Operador")
                         Section{
                            Picker(selection: $operador, label: EmptyView()) {
                               ForEach(0 ..< operadores.count) {
                                Text(self.operadores[$0]).tag($0)
                               }
                           }
                       }
                    }
                    VStack(alignment: .leading) {
                       Text("Puestos")
                        TextField("Numero de puestos",text: $puestos)
                            .keyboardType(.numbersAndPunctuation)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(5.0)
                    .padding(.horizontal, 15)
                   }
                    VStack(alignment: .leading) {
                         Text("CCS Combo")
                         TextField("Puestos CSS Combo",text: $ccs)
                             .keyboardType(.numbersAndPunctuation)
                         .textFieldStyle(RoundedBorderTextFieldStyle())
                         .cornerRadius(5.0)
                     .padding(.horizontal, 15)
                    }
                    VStack(alignment: .leading) {
                         Text("Type 2")
                         TextField("Puestos Type2",text: $type2)
                             .keyboardType(.numbersAndPunctuation)
                         .textFieldStyle(RoundedBorderTextFieldStyle())
                         .cornerRadius(5.0)
                     .padding(.horizontal, 15)
                    }
                    VStack(alignment: .leading) {
                         Text("CHAdeMO")
                         TextField("Puestos CHAdeMO",text: $chademo)
                            .keyboardType(.numbersAndPunctuation)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(5.0)
                     .padding(.horizontal, 15)
                    }
                    VStack(alignment: .leading) {
                         Text("Schuko")
                         TextField("Puesto Schukos",text: $schuko)
                             .keyboardType(.numbersAndPunctuation)
                         .textFieldStyle(RoundedBorderTextFieldStyle())
                         .cornerRadius(5.0)
                     .padding(.horizontal, 15)
                    }
                    VStack(alignment: .leading) {
                        Text("Rango de potencias del cargador")
                         TextField("50kw, 22kw-50kw-125kw...",text: $rango)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(5.0)
                     .padding(.horizontal, 15)
                    }
                    VStack(alignment: .leading) {
                        Text("Estado")
                         Section{
                            Picker(selection: $estado, label: EmptyView()) {
                               ForEach(0 ..< estados.count) {
                                Text(self.estados[$0]).tag($0)
                               }
                           }
                       }
                    }
                }   
                //Informacion
                Section(header: Text("Información")){
                    VStack(alignment: .leading) {
                        Text("URL")
                        TextField("Dirección web", text: $url)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(5.0)
                        .padding(.horizontal, 15)
                    }
                    VStack(alignment: .leading) {
                        Text("Precio del kW/h o tarifa del operador")
                        TextField("Coste del kW/h o tarifa", text: $cost)
                            .keyboardType(.numbersAndPunctuation)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(5.0)
                        .padding(.horizontal, 15)
                    }
                    VStack(alignment: .leading) {
                        Text("Horario")
                        TextField("24/7, 9:00-21:00...", text: $horario)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(5.0)
                        .padding(.horizontal, 15)
                    }
                    VStack(alignment: .leading) {
                        HStack{
                           Spacer()
                            GADBannerViewController()
                                .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                            Spacer()
                        }
                    }
                }
                Section{
                    VStack(alignment: .leading) {
                        Button(action:self.comprobarCampos){
                            Text("Enviar").foregroundColor(Color.blue)
                        }.cornerRadius(5.0)
                        .alert(isPresented: $showingAlert) {
                            switch activeAlert{
                                case .first:
                                    return Alert(title: Text("Aviso"), message: Text("Rellene todos los campos."), dismissButton: .default(Text("OK")))
                                case .second:
                                    return Alert(title: Text("Aviso"), message: Text("El punto de carga se ha añadido correctamente."), dismissButton: .default(Text("OK")))
                                case .third:
                                    return Alert(title: Text("Aviso"), message: Text("Por favor, corrija el coste, no debe tener comas ','."), dismissButton: .default(Text("OK")))
                                case .fourd:
                                     return Alert(title: Text("Aviso"), message: Text("Por favor, corrija el valor, debe ser un número."), dismissButton: .default(Text("OK")))
                            }
                            
                           
                        }
                        
                    .padding(.horizontal, 15)
                    
                    }
                    
                }
                
            }
            /*
                 .offset(y: -self.value)
                 .animation(.spring())
                 .onAppear{
                     NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main){ (noti)in
                         let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                         let height = value.height
                         self.value = height - 150
                         
                     }
                     NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main){ (noti) in
                         self.value = 0
                     }
                 }
                 */
                 
            .navigationBarTitle(Text("Añadir punto"))
           }
            
        }
    func comprobarCampos(){
            if name == ""{
                self.activeAlert = .first
                self.showingAlert = true
            } else if ciudad == ""{
                self.activeAlert = .first
                self.showingAlert = true
            } else if direccion == ""{
                self.activeAlert = .first
                self.showingAlert = true
            }else if url == ""{
                self.activeAlert = .first
                self.showingAlert = true
            }else if horario == ""{
                self.activeAlert = .first
                self.showingAlert = true
            }else if puestos == ""{
               self.activeAlert = .first
                self.showingAlert = true
            }else if cost == ""{
                self.activeAlert = .first
                self.showingAlert = true
            }else if ccs == ""{
                self.activeAlert = .first
                self.showingAlert = true
            }else if type2 == ""{
                self.activeAlert = .first
                self.showingAlert = true
            }else if chademo == ""{
               self.activeAlert = .first
                self.showingAlert = true
            }else if schuko == ""{
                self.activeAlert = .first
                self.showingAlert = true
            }else if rango == ""{
                self.activeAlert = .first
                self.showingAlert = true
            }else{
                let regex = "[A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ.-]+"
                if cost.contains(","){
                    self.activeAlert = .third
                    self.showingAlert = true
                }else if puestos.matches(regex){
                    self.activeAlert = .fourd
                    self.showingAlert = true
                }else if ccs.matches(regex){
                    self.activeAlert = .fourd
                    self.showingAlert = true
                }else if type2.matches(regex){
                    self.activeAlert = .fourd
                    self.showingAlert = true
                }else if chademo.matches(regex){
                    self.activeAlert = .fourd
                    self.showingAlert = true
                }else if schuko.matches(regex){
                    self.activeAlert = .fourd
                    self.showingAlert = true
                }else{
                    obtenerCoord()
                }
            }
            
        }
    func obtenerCoord(){
         print(direccion)
         print(ciudad)
         let direccionCompleta = direccion + "," + ciudad
         let geocoder = CLGeocoder()
         geocoder.geocodeAddressString(direccionCompleta) {(placemarks, error) in
             guard let placemarks = placemarks,
                 let location = placemarks.first?.location
             else {
                 // handle no location found
                 return
             }
             self.leerCoordenadas(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        }
     }
     func leerCoordenadas(latitude: Double, longitude:Double){
         print(latitude)
         print(longitude)
         subirDatos(latitude: latitude, longitude: longitude)
     }
    func subirDatos(latitude: Double, longitude:Double){
        //pasar a int
        let puestosInt = Int(puestos)
        let costDouble = Double(cost)
        let ccsInt = Int(ccs)
        let type2Int = Int(type2)
        let chademoInt = Int(chademo)
        let schukoInt = Int(schuko)
        
        let paisSelect:String = paises[pais]
        let operadorSelect:String = operadores[operador]
        let estadoSelect: String = estados[estado]
        let id : Int = datas.data.count + 1
        let urlSelect: String = "https://" + url + ""
        let coordData: [String: Any] = ["longitude":longitude ,"latitude":latitude]
        let conectData: [String: Any] = ["ccs":ccsInt! ,"type2":type2Int!,"chademo":chademoInt!,"schuko":schukoInt!]
        
        //Subir datos
        let db = Firestore.firestore()
        let puntos = db.collection("puntosRevision").document()
        puntos.setData(["id": id, "name": name, "address": direccion, "city":ciudad, "country": paisSelect, "charger": operadorSelect, "url":urlSelect,"hours": horario, "puestos":puestosInt!, "cost": costDouble!, "power": rango, "status":estadoSelect, "conectors":conectData,"coordinates":coordData]){(err) in
            if err != nil{
                print ("err")
                return
            }
            self.activeAlert = .second
            self.showingAlert = true
            print("success")
        }
        
    }

      
    }

extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
enum ActiveAlert {
    case first, second, third, fourd
}
/*
 struct AddSheetView_Previews: PreviewProvider {
     static var previews: some View {
         AddSheetView()
     }
 }

 */
