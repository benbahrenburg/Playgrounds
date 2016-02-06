//: Time Zone Extension Experiments

import UIKit

extension NSTimeZone {
    
    func exists(name : String) -> Bool {
        return NSTimeZone.knownTimeZoneNames().contains(name)
    }
    
}
