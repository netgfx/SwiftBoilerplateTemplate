//
//  Router.swift
//  QuickStartTemplate
//
//  Created by Mixalis Dobekidis on 25/6/20.
//  Copyright © 2020 Mixalis Dobekidis. All rights reserved.
//

import Foundation
import UIKit
import URLNavigator
import Hero

struct Router {
  static func initialize(navigator: NavigatorType) {
    navigator.register("app://home") { url, values, context in
        let vc2 = HomeVC(navigator: navigator)
        vc2.hero.isEnabled = true
        vc2.hero.modalAnimationType = .selectBy(presenting: .cover(direction: .up), dismissing: .cover(direction: .down))
        
        return vc2
    }
    navigator.register("app://about") { url, values, context in
        let vc2 = AboutVC(navigator: navigator)
        vc2.hero.isEnabled = true
        vc2.hero.modalAnimationType = .selectBy(presenting: .cover(direction: .up), dismissing: .cover(direction: .down))
        return vc2
    }
  }
}
