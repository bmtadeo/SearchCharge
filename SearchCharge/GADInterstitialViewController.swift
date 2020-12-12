//
//  GADInterstitialViewController.swift
//  SearchCharge
//
//  Created by Borja Martinez Tadeo on 12/01/2020.
//  Copyright © 2020 Borja Martinez Tadeo. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
import GoogleMobileAds

final class GADInterstitialViewController: UIViewControllerRepresentable {
    public var interstitial: GADInterstitial!
    public func makeUIViewController(context: UIViewControllerRepresentableContext<GADInterstitialViewController>) -> UIViewController {
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/1033173712")
        let viewController = UIViewController()
        let request = GADRequest()
        interstitial.load(request)

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<GADInterstitialViewController>) {

    }



}
