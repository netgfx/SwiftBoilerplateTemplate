//
//  VersionNumber.swift
//  QuickStartTemplate
//
//  Created by Mixalis Dobekidis on 25/6/20.
//  Copyright © 2020 Mixalis Dobekidis. All rights reserved.
//

import Foundation

struct VersionNumber {
    public var currentVersionNumber:Float = 0.1
    
    mutating func updateVersion(newVersion:Float) {
        currentVersionNumber = newVersion
    }
    
    var getVersionNumber: String {
        return String(format: "%.1f", self.currentVersionNumber)
    }
    
    var originalVersionNumber: Float {
        return currentVersionNumber
    }
    
}
