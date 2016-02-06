//: A few useful NSDate extensions

import UIKit

extension NSDate {
    
    convenience init?(dateString : String, format : String) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        self.init(timeIntervalSince1970 : (dateFormatter.dateFromString(dateString)?.timeIntervalSince1970)!)
    }
    
    var day : Int {
         return NSCalendar.currentCalendar().ordinalityOfUnit(.Day, inUnit: .Month, forDate: self)
    }
    
    var dayOfYear : Int {
        return NSCalendar.currentCalendar().ordinalityOfUnit(.Day, inUnit: .Year, forDate: self)
    }
    
    var hour : Int {
       return NSCalendar.currentCalendar().components(.Hour, fromDate: self).hour
    }
    
    var minute : Int {
        return NSCalendar.currentCalendar().components(.Minute, fromDate: self).minute
    }
    
    var month : Int {
        return NSCalendar.currentCalendar().components(.Month, fromDate: self).month
    }
    
    var year : Int {
        return NSCalendar.currentCalendar().components(.Year, fromDate: self).year
    }

    func addMinutes(minutes : Int) -> NSDate {
        return NSCalendar.currentCalendar().dateByAddingUnit(
            .Minute, value: minutes, toDate: self,
            options: NSCalendarOptions(rawValue: 0))!
    }
    
    func addHours(hours : Int) -> NSDate {
        return NSCalendar.currentCalendar().dateByAddingUnit(
            .Hour, value: hours, toDate: self,
            options: NSCalendarOptions(rawValue: 0))!
    }
    
    func addDays(days : Int) -> NSDate {
        return NSCalendar.currentCalendar().dateByAddingUnit(
            .Day, value: days, toDate: self,
            options: NSCalendarOptions(rawValue: 0))!
    }

    func addMonths(months : Int) -> NSDate {
        return NSCalendar.currentCalendar().dateByAddingUnit(
            .Month, value: months, toDate: self,
            options: NSCalendarOptions(rawValue: 0))!
    }

    func addYears(years : Int) -> NSDate {
        return NSCalendar.currentCalendar().dateByAddingUnit(
            .Year, value: years, toDate: self,
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

    func dateString(style : NSDateFormatterStyle, timezone : NSTimeZone) -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = style
        formatter.timeZone = timezone
        return formatter.stringFromDate(self)
    }
    
    func timeString(style : NSDateFormatterStyle = .ShortStyle) -> String {
        let formatter = NSDateFormatter()
        formatter.timeStyle = style
        return formatter.stringFromDate(self)
    }

    func timeString(style : NSDateFormatterStyle, timezone : NSTimeZone) -> String {
        let formatter = NSDateFormatter()
        formatter.timeStyle = style
        formatter.timeZone = timezone
        return formatter.stringFromDate(self)
    }
    
    func getComponentsWithTimeZone(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> NSDateComponents {
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self)
    }
    
    func between(toDate : NSDate, units : NSCalendarUnit = [NSCalendarUnit.Day] ) -> NSDateComponents {
        return NSCalendar.currentCalendar().components(units, fromDate: self, toDate: toDate, options: [])
    }
    
}

NSDate(dateString: "2013-09-29T18:46:19-0700", format: "yyyy-MM-dd'T'HH:mm:ssZ")

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

NSDate().getComponentsWithTimeZone().day
NSDate().getComponentsWithTimeZone(NSTimeZone(name: "Asia/Kuala_Lumpur")!).day

NSDate().between(NSDate().addMonths(1),units :NSCalendarUnit.Hour).day

