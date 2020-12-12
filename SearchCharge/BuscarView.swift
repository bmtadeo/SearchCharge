//
//  BuscarView.swift
//  Puntos de Recarga
//
//  Created by Borja Martinez Tadeo on 29/09/2019.
//  Copyright © 2019 Borja Martinez Tadeo. All rights reserved.
//

import SwiftUI
import Firebase
import GoogleMobileAds

 struct CategoriaOperadorView: View{
     var operadores = ["Supercharger","Tesla Destination Charging","Ionity","Iberdrola","Easy Charger","Ibil","Endesa", "Polar Network","Todos"]
    @State private var text : String = ""
    @State private var showShareSheet = false

     var body: some View {
         NavigationView {
             VStack{
                List{
                    ForEach(operadores, id: \.self){ operador in
                        NavigationLink(destination: BuscarView(operador: operador)){
                           CategoriaRow(operador: operador)
                        }
                        
                    }
                }.environment(\.defaultMinListRowHeight, 125)
             .navigationBarTitle(Text("Operadores"), displayMode: .automatic)
             .navigationBarItems(trailing: Button(action: {
                      self.showShareSheet = true
                 }){
                     Image(systemName: "plus").font(.title)
                 })
             .sheet(isPresented: $showShareSheet) {
                AddView()
             }
                
         }
         
     }
 }
 
}
struct CategoriaRow: View{
    var operador : String
    var body: some View{
                HStack{
                    if operador == "Supercharger"{
                        Image("supercharger64")
                        .resizable()
                        .frame(width: 40, height: 40)
                    }else if operador == "Tesla Destination Charging"{
                        Image("tesladc")
                        .resizable()
                        .frame(width: 33, height: 50)
                        
                    }else if operador == "Ionity"{
                        Image("ionity64")
                        .resizable()
                        .frame(width: 40, height: 40)
                    }else if operador == "Iberdrola"{
                        Image("iberdrola64")
                        .resizable()
                        .frame(width: 40, height: 40)
                    }else if operador == "Easy Charger"{
                        Image("easycharger64")
                        .resizable()
                        .frame(width: 40, height: 40)
                    }else if operador == "Ibil"{
                        Image("ibil64")
                        .resizable()
                        .frame(width: 40, height: 40)
                    }else if operador == "Endesa"{
                        Image("endesa64")
                        .resizable()
                        .frame(width: 40, height: 40)
                    }else if operador == "Polar Network"{
                        Image("polar64")
                        .resizable()
                        .frame(width: 40, height: 40)
                    }else if operador == "Todos"{
                        Image(systemName: "list.dash")
                        .resizable()
                        .frame(width: 25, height: 25)
                    }
                     VStack(alignment: .leading){
                        Text(operador)
                    }
                    
                }
    
    }
}


struct BuscarView: View {
    @State private var text : String = ""
    @State private var showShareSheet = false
    @ObservedObject var datas = observer()
    @State var value : CGFloat = 0
    var operador : String
    var body: some View {
     //NavigationView {
            VStack{
                 List{
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("Buscar por ciudad", text: $text)
                    }
                    HStack{
                         Spacer()
                        GADBannerViewController()
                            .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                        Spacer()
                    }
                     if text == ""{
                        if operador == "Todos"{
                           ForEach(datas.data){ punto in
                            if punto.id == 125{
                                HStack{
                                     Spacer()
                                    GADBannerViewController()
                                        .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                                    Spacer()
                                }
                            }else if punto.id == 255{
                                HStack{
                                     Spacer()
                                    GADBannerViewController()
                                        .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                                    Spacer()
                                }
                            }else if punto.id == 355{
                                HStack{
                                     Spacer()
                                    GADBannerViewController()
                                        .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                                    Spacer()
                                }
                            }else if punto.id == 455{
                                HStack{
                                     Spacer()
                                    GADBannerViewController()
                                        .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                                    Spacer()
                                }
                            }else if punto.id == 555{
                                HStack{
                                     Spacer()
                                    GADBannerViewController()
                                        .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                                    Spacer()
                                }
                            }else if punto.id == 655{
                                HStack{
                                     Spacer()
                                    GADBannerViewController()
                                        .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                                    Spacer()
                                }
                            }else if punto.id == 755{
                                HStack{
                                     Spacer()
                                    GADBannerViewController()
                                        .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                                    Spacer()
                                }
                            }else if punto.id == 855{
                                HStack{
                                     Spacer()
                                    GADBannerViewController()
                                        .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                                    Spacer()
                                }
                            }
                               NavigationLink(destination: PuntoCargaDetail(punto: punto)) {
                                   PuntoCargaRow(punto: punto)
                               }
                           }
                        }else if operador != "Todos"{
                            ForEach(datas.data.filter{$0.charger.contains(operador)}){ punto in
                                NavigationLink(destination: PuntoCargaDetail(punto: punto)) {
                                    PuntoCargaRow(punto: punto)
                                }
                            }
                        }
                     }else{
                        if operador == "Todos"{
                            ForEach(filtrar(operador:operador)){ punto in
                               NavigationLink(destination: PuntoCargaDetail(punto: punto)) {
                                   PuntoCargaRow(punto: punto)
                               }
                           }
                        }else if operador != "Todos"{
                            ForEach(filtrar(operador:operador), id:\.self){ punto in
                                NavigationLink(destination: PuntoCargaDetail(punto: punto)) {
                                    PuntoCargaRow(punto: punto)
                                }
                            }
                        }
                    }
                    HStack{
                         Spacer()
                        GADBannerViewController()
                            .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                        Spacer()
                    }
                 }.environment(\.defaultMinListRowHeight, 75)
                  

             }
            .navigationBarTitle(Text("Buscar"), displayMode: .automatic)
            .navigationBarItems(trailing: HStack { AddButton(destination: AddView())  } )
                 .navigationBarItems(trailing: Button(action: {
                      self.showShareSheet = true
                 }){
                     Image(systemName: "plus").font(.title)
                 })
            .sheet(isPresented: $showShareSheet) {
                AddView()
            }
            
            
         //}
    }
    func filtrar(operador: String)->[PuntoCarga]{
        var filtrado = [PuntoCarga]()
        if operador == "Todos"{
            filtrado = datas.data.filter{$0.city.contains(text)}
        }else if operador != "Todos"{
            filtrado = datas.data.filter{$0.charger.contains(operador) &&  $0.city.contains(text)}
        }
        return filtrado
    }
    
}
struct AddButton<Destination : View>: View {

    var destination:  Destination

    var body: some View {
        NavigationLink(destination: self.destination) {
            Image(systemName: "plus").font(.title)
        }
    }
}

/*
 struct BuscarView_Previews: PreviewProvider {
     static var previews: some View {
         BuscarView()
     }
 }

 */



/*
 .offset(y: -self.value)
 .animation(.spring())
 .onAppear{
     NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification, object: nil, queue: .main){ (noti)in
         let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
         let height = value.height
         self.value = height
         
     }
     NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main){ (noti) in
         self.value = 0
     }
 }
 */
