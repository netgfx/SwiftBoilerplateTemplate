//
//  UIApplicationExtension.swift
//  QuickStartTemplate
//
//  Created by Mixalis Dobekidis on 29/6/20.
//  Copyright © 2020 Mixalis Dobekidis. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {

    class func getTopMostViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        } else {
            return nil
        }
    }
}
