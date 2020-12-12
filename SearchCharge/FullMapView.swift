//
//  FullMapView.swift
//  Puntos de Recarga
//
//  Created by Borja Martinez Tadeo on 27/09/2019.
//  Copyright © 2019 Borja Martinez Tadeo. All rights reserved.
//

import SwiftUI
import MapKit
import Firebase

struct FullMapView: UIViewRepresentable  {
    let initialLocation = CLLocation(latitude: 40.282778, longitude: 5.829444)
    var puntos: [PuntoCarga]
    let regionRadius: CLLocationDistance = 500
    @Binding var selectedPunto: PuntoCarga?
    fileprivate let locationManager : CLLocationManager = CLLocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.delegate = context.coordinator
        return map
    }
    func updateUIView(_ view: MKMapView, context: Context) {
        view.isUserInteractionEnabled = true
        view.showsTraffic = true
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        view.showsUserLocation = true
        let annotations = anadirAnnotations(view:view)
        //view.showAnnotations(annotations, animated: true)
        if annotations.count != view.annotations.count{
           view.removeAnnotations(view.annotations)
           view.addAnnotations(annotations)
        }else if annotations.count == view.annotations.count{
            view.removeAnnotations(view.annotations)
            view.addAnnotations(annotations)
        }
        
    }
    func obtenerCoordenadas() -> [CLLocationCoordinate2D]{
        var coordinates = [CLLocationCoordinate2D]()
        for punto in puntos{
            coordinates.append(punto.locationCoordinate)
        }
        return coordinates
    }
    func anadirAnnotations(view: MKMapView)-> [MKPointAnnotation]{
        let coordinates = obtenerCoordenadas()
        var annotations = [MKPointAnnotation]()
        for (punto, coordinate) in zip(puntos,coordinates){
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
            annotation.title = punto.name
            annotation.subtitle = "Operador: \(punto.charger)\nEstado: \(punto.status)\nPuestos: \(punto.puestos)\nPotencia: \(punto.power)\nCCS Combo: \(punto.conectors.ccs)\nType2: \(punto.conectors.type2)\nCHAdeMo: \(punto.conectors.chademo)\nSchuko: \(punto.conectors.schuko)"
            annotations.append(annotation)
        }
       
        return annotations
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(self, puntos:puntos)
    }
    
    final class Coordinator: NSObject, MKMapViewDelegate {
           var control: FullMapView
           var puntos: [PuntoCarga]
        init(_ control: FullMapView, puntos: [PuntoCarga]) {
               self.control = control
                self.puntos = puntos
           }
           
           func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
               guard let coordinates = view.annotation?.coordinate else { return }
               let span = mapView.region.span
               let region = MKCoordinateRegion(center: coordinates, span: span)
               mapView.setRegion(region, animated: true)
           }
           func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
               if control == view.rightCalloutAccessoryView {
                for punto in puntos{
                    if view.annotation?.title == punto.name{
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
                //print(view.annotation?.title)
               }
           }
           func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
             guard annotation is MKPointAnnotation else { return nil }

             let identifier = "Annotation"
             var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            // if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView!.canShowCallout = true
                annotationView!.calloutOffset = CGPoint(x: -5, y: 5)
                let mapButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 30, height: 30)))
                mapButton.setBackgroundImage(UIImage(systemName: "car"), for: UIControl.State())
                annotationView!.rightCalloutAccessoryView = mapButton
                
                let detailLabel = UILabel()
                detailLabel.numberOfLines = 0
                detailLabel.font = detailLabel.font.withSize(12)
                detailLabel.text = annotation.subtitle!
                annotationView!.detailCalloutAccessoryView = detailLabel
                
                 let subtitle :String = annotation.subtitle!!
                 if subtitle.contains("Supercharger") && subtitle.contains("Funcionamiento") {
                    annotationView?.image = UIImage(named: "supercharger24")
                 }else if subtitle.contains("Ibil") && subtitle.contains("Funcionamiento") {
                     annotationView?.image = UIImage(named: "ibil24")
                 }else if subtitle.contains("Tesla Destination Charging") && subtitle.contains("Funcionamiento") {
                     annotationView?.image = UIImage(named: "destination24")
                 }else if subtitle.contains("Iberdrola") && subtitle.contains("Funcionamiento") {
                     annotationView?.image = UIImage(named: "iberdrola24")
                 }else if subtitle.contains("Easy Charger") && subtitle.contains("Funcionamiento") {
                     annotationView?.image = UIImage(named: "easycharger24")
                 }else if subtitle.contains("Ionity") && subtitle.contains("Funcionamiento") {
                     annotationView?.image = UIImage(named: "ionity24")
                 }else if subtitle.contains("Endesa") && subtitle.contains("Funcionamiento") {
                     annotationView?.image = UIImage(named: "endesa24")
                 }else if subtitle.contains("Polar Network") && subtitle.contains("Funcionamiento") {
                     annotationView?.image = UIImage(named: "polar24")
                 }else{
                    if subtitle.contains("Supercharger") && (subtitle.contains("Construccion") || subtitle.contains("Mantenimiento")){
                        annotationView?.image = UIImage(named: "cone24")
                    }else if subtitle.contains("Ibil") && (subtitle.contains("Construccion") || subtitle.contains("Mantenimiento")){
                        annotationView?.image = UIImage(named: "cone24")
                    }else if subtitle.contains("Tesla Destination Charging") && (subtitle.contains("Construccion") || subtitle.contains("Mantenimiento")){
                        annotationView?.image = UIImage(named: "cone24")
                    }else if subtitle.contains("Iberdrola") && (subtitle.contains("Construccion") || subtitle.contains("Mantenimiento")){
                        annotationView?.image = UIImage(named: "cone24")
                    }else if subtitle.contains("Easy Charger") && (subtitle.contains("Construccion") || subtitle.contains("Mantenimiento")){
                        annotationView?.image = UIImage(named: "cone24")
                    }else if subtitle.contains("Ionity") && (subtitle.contains("Construccion") || subtitle.contains("Mantenimiento")){
                        annotationView?.image = UIImage(named: "cone24")
                    }else if subtitle.contains("Endesa") && (subtitle.contains("Construccion") || subtitle.contains("Mantenimiento")){
                        annotationView?.image = UIImage(named: "cone24")
                    }else if subtitle.contains("Polar Network") && (subtitle.contains("Construccion") || subtitle.contains("Mantenimiento")){
                        annotationView?.image = UIImage(named: "cone24")
                    }
                }
                 

           //  } else {
               //  annotationView!.annotation = annotation
           //  }
                
             return annotationView
           }
        
       }
}

