//
//  GADBannerViewController.swift
//  SearchCharge
//
//  Created by Borja Martinez Tadeo on 06/10/2019.
//  Copyright © 2019 Borja Martinez Tadeo. All rights reserved.
//

 import SwiftUI
 import GoogleMobileAds
 import UIKit

 struct GADBannerViewController: UIViewControllerRepresentable {
    
     func makeUIViewController(context: Context) -> UIViewController {
         let view = GADBannerView(adSize: kGADAdSizeBanner)
         let viewController = UIViewController()
         view.adUnitID = "ca-app-pub-3940256099942544/6300978111"
         view.rootViewController = viewController
         viewController.view.addSubview(view)
         viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeBanner.size)
         view.load(GADRequest())
         return viewController
     }

     func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
 }

/*
 struct GADBannerViewController_Previews: PreviewProvider {
     static var previews: some View {
         GADBannerViewController()
     }
 }
 */
