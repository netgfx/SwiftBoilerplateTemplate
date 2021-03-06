//
//  ViewController.swift
//  QuickStartTemplate
//
//  Created by Mixalis Dobekidis on 25/6/20.
//  Copyright © 2020 Mixalis Dobekidis. All rights reserved.
//

import UIKit
import URLNavigator

class HomeVC: UIViewController {

    private let navigator: NavigatorType
    
    init(navigator: NavigatorType) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
        self.title = "Home"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.addGUI()
    }
    
    
    func addGUI() {
        self.view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "Home View"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .center
        
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, constant:  0).isActive = true
        label.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 1).isActive = true
        label.centerYAnchor.constraint(equalToSystemSpacingBelow: self.view.centerYAnchor, multiplier: 1).isActive = true
        
        ///
        
        let button:UIButton = UIButton(type: .system)
        button.titleLabel?.text = "About"
        
        button.setTitle("About", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .black
        self.view.addSubview(button)
        button.anchor(top: nil, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 24, bottom: 24, right: 24), size: .init(width: 0, height: 48))
        button.addTarget(self, action: #selector(self.navigateToAbout), for: .touchUpInside)
        
    }
    
    
    @objc func navigateToAbout(){
        print("going forward...")
        
        self.navigationController?.hero.navigationAnimationType = .autoReverse(presenting: .cover(direction: .up))
        
        self.navigator.push("app://about", context: nil, from: nil, animated: true)
    }


}

