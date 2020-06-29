//
//  AboutVC.swift
//  QuickStartTemplate
//
//  Created by Mixalis Dobekidis on 25/6/20.
//  Copyright © 2020 Mixalis Dobekidis. All rights reserved.
//

import UIKit
import URLNavigator
import Hero

class AboutVC: UIViewController {

    private let navigator: NavigatorType
    private var label:UILabel!
    
    init(navigator: NavigatorType) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
        self.title = "About"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.addGUI()
        self.addEventListeners()
    }
    
    func addEventListeners() {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            appDelegate.globalEvents.listenTo(eventName: AboutEvents.CURRENT_VERSION_CHANGE.action, action: updateText)
        }
    }
    
    
    
    
    func addGUI() {
        self.view.backgroundColor = UIColor(rgb: 0xfec72c, alphaVal: 1.0)
        
        label = UILabel()
        label.text = "v"+DataManager.shared.getVersionNumber()
        label.font = UIFont.systemFont(ofSize: 42)
        label.textColor = .black
        label.textAlignment = .center
        
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, constant:  0).isActive = true
        label.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 1).isActive = true
        label.centerYAnchor.constraint(equalToSystemSpacingBelow: self.view.centerYAnchor, multiplier: 1).isActive = true
        
        let button:UIButton = UIButton(type: .system)
        button.setTitle("Increase Version", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .black
        self.view.addSubview(button)
        button.anchor(top: nil, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 24, bottom: 24, right: 24), size: .init(width: 0, height: 48))
        button.addTarget(self, action: #selector(self.increaseVersion), for: .touchUpInside)
    }
    
    // increase by 0.1
    @objc func increaseVersion() {
        DataManager.shared.setVersionNumber(value: 0.1)
    }
    
    // update the text
    func updateText() {
        label.text = "v"+DataManager.shared.getVersionNumber()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
