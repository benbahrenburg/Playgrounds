//: Playground - noun: a place where people can play

import UIKit
import Foundation

extension Date {
    func add(minutes: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .minute, value: minutes, to: self)!
    }
    func between(toDate: Date, component: Calendar.Component) -> DateComponents {
        let calendar = Calendar.current
        return calendar.dateComponents([component], from: self, to: toDate)
    }
}

let test = Date(timeIntervalSinceNow: 122*60)

Date().between(toDate: test, component: Calendar.Component.hour).hour!



