//
//  ShareSheetView.swift
//  SearchCharge
//
//  Created by Borja Martinez Tadeo on 19/10/2019.
//  Copyright © 2019 Borja Martinez Tadeo. All rights reserved.
//

import SwiftUI
import UIKit
import SwiftRater

struct ShareSheetView: UIViewControllerRepresentable {
   typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void
    
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    let excludedActivityTypes: [UIActivity.ActivityType]? = nil
    let callback: Callback? = nil
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities)
        controller.excludedActivityTypes = excludedActivityTypes
        controller.completionWithItemsHandler = callback
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // nothing to do here
    }
}

/*
 struct ShareSheetView_Previews: PreviewProvider {
     static var previews: some View {
         ShareSheetView()
     }
 }
 */
