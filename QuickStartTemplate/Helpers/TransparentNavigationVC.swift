//
//  TransparentNavigationVC.swift
//  QuickStartTemplate
//
//  Created by Mixalis Dobekidis on 25/6/20.
//  Copyright © 2020 Mixalis Dobekidis. All rights reserved.
//

import Foundation
import UIKit
import Hero

class TransparentNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //delegate = self
        //interactivePopGestureRecognizer?.delegate = self
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
        navigationBar.tintColor = UIColor.black
        
        self.isHeroEnabled = true
    
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return childForStatusBarStyle?.preferredStatusBarStyle ?? .default
    }


}
