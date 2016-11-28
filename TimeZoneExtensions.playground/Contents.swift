//: Time Zone Extension Experiments

import UIKit

extension TimeZone {
    
    func exists(_ name : String) -> Bool {
        return TimeZone.knownTimeZoneIdentifiers.contains(name)
    }
    
}
