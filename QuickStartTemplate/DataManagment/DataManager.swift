//
//  DataManager.swift
//  QuickStartTemplate
//
//  Created by Mixalis Dobekidis on 25/6/20.
//  Copyright © 2020 Mixalis Dobekidis. All rights reserved.
//

import Foundation
import UIKit

class DataManager {
    
    static let shared = DataManager()
    
    // observe VersionNumber Variable
    // when a change happens to the current version number, the observer fires and also triggers a global event to update
    // possible listeners
    public var _versionNumber:VersionNumber = VersionNumber() {
        didSet {
            print(self._versionNumber.getVersionNumber)
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                appDelegate.globalEvents.trigger(eventName: AboutEvents.CURRENT_VERSION_CHANGE.action)
            }
        }
    }

    // END OF OBSERVERS //
    
    // GETTERS //
    
    public func getVersionNumber() -> String {
        return String(format: "%.1f", _versionNumber.originalVersionNumber)
    }
    
    // SETTERS //
    
    public func setVersionNumber(value:Float) {
        
       _versionNumber.updateVersion(newVersion: self._versionNumber.originalVersionNumber+value) // this should trigger the observer
    }
    
    // init //
    public func initialize() {
        
    }
    
    // Prevent non singleton access.
    private init(){
        
    }
}


//class AboutObserver: NSObject {
//    @objc var versionNumber: VersionNumber
//    var observation: NSKeyValueObservation?
//
//    init(object: VersionNumber) {
//        versionNumber = object
//        super.init()
//
//        observation = observe(
//            \.versionNumber.currentVersionNumber,
//            options: [.old, .new]
//        ) { object, change in
//            print("version changed from: \(change.oldValue!), updated to: \(change.newValue!)")
//            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
//                appDelegate.globalEvents.trigger(eventName: AboutEvents.CURRENT_VERSION_CHANGE.action)
//            }
//        }
//    }
//}
