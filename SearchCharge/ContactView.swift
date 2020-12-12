//
//  ContactView.swift
//  SearchCharge
//
//  Created by Borja Martinez Tadeo on 13/11/2019.
//  Copyright © 2019 Borja Martinez Tadeo. All rights reserved.
//

import SwiftUI

struct ContactView: View {
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
               HStack{
                   Image(systemName: "envelope.fill")
                   Text("¿Cómo puedo añadir un nuevo punto de recarga?")
               }
            }
            .navigationBarTitle(Text("Contacto"))
        }
    }
}

/*
 struct ContactView_Previews: PreviewProvider {
     static var previews: some View {
         ContactView()
     }
 }
 */
