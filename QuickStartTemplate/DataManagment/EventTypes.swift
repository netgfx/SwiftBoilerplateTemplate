//
//  EventTypes.swift
//  QuickStartTemplate
//
//  Created by Mixalis Dobekidis on 25/6/20.
//  Copyright © 2020 Mixalis Dobekidis. All rights reserved.
//

import Foundation

public enum AboutEvents {
    case CURRENT_VERSION_CHANGE
    
    var action:String {
        switch self {
            case .CURRENT_VERSION_CHANGE:
                return "VERSION_CHANGE"
        }
    }
    ///
}
