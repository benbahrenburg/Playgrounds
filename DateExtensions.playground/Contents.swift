//: Date extensions

import UIKit

extension NSDate {
    
    var day : Int {
         return NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!.components([NSCalendarUnit.Day], fromDate: self).day
    }
    
    var dayOfYear : Int {
        return NSCalendar.currentCalendar().ordinalityOfUnit(.Day, inUnit: .Year, forDate: self)
    }
    
    var hour : Int {
       return NSCalendar.currentCalendar().components([NSCalendarUnit.Hour], fromDate: self).hour
    }
    
    var minute : Int {
        return NSCalendar.currentCalendar().components([NSCalendarUnit.Minute], fromDate: self).minute
    }
    
    var month : Int {
        return NSCalendar.currentCalendar().components([NSCalendarUnit.Month], fromDate: self).month
    }
    
    var year : Int {
        return NSCalendar.currentCalendar().components([NSCalendarUnit.Year], fromDate: self).year
    }

    func addMinutes(minutes : Int) -> NSDate {
        return NSCalendar.currentCalendar().dateByAddingUnit(
            .Minute,
            value: minutes,
            toDate: self,
            options: NSCalendarOptions(rawValue: 0))!
    }
    
    func addHours(hours : Int) -> NSDate {
        return NSCalendar.currentCalendar().dateByAddingUnit(
            .Hour,
            value: hours,
            toDate: self,
            options: NSCalendarOptions(rawValue: 0))!
    }
    
    func addDays(days : Int) -> NSDate {
        return NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: days,
            toDate: self,
            options: NSCalendarOptions(rawValue: 0))!
    }

    func addMonths(months : Int) -> NSDate {
        return NSCalendar.currentCalendar().dateByAddingUnit(
            .Month,
            value: months,
            toDate: self,
            options: NSCalendarOptions(rawValue: 0))!
    }

    func addYears(years : Int) -> NSDate {
        return NSCalendar.currentCalendar().dateByAddingUnit(
            .Year,
            value: years,
            toDate: self,
            options: NSCalendarOptions(rawValue: 0))!
    }
    
    func getTime() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    func dateString(style : NSDateFormatterStyle = .MediumStyle) -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = style
        return formatter.stringFromDate(self)
    }

    func timeString(style : NSDateFormatterStyle = .ShortStyle) -> String {
        let formatter = NSDateFormatter()
        formatter.timeStyle = style
        return formatter.stringFromDate(self)
    }
    
}

NSDate().dateString()
NSDate().dateString(.LongStyle)

NSDate().timeString()
NSDate().timeString(.MediumStyle)

NSDate().dayOfYear
NSDate().day
NSDate().minute
NSDate().hour
NSDate().month
NSDate().year

NSDate().addDays(1)
NSDate().addMonths(1)
NSDate().addYears(1)
NSDate().addMinutes(45)
NSDate().addHours(2)

NSDate().getTime()