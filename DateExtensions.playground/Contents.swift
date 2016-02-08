//: Willow Swift dates that borrow for other platforms (C#, JavaScript etc)

import UIKit

extension NSDate {
  
    convenience init?(year : Int, month : Int, day : Int, hours : Int = 0, minutes : Int = 0, seconds : Int = 0) {
        let component = NSDateComponents()
        component.year = year
        component.month = month
        component.day = day
        component.hour = hours
        component.minute = minutes
        component.second = seconds
        self.init(timeIntervalSince1970 : (NSCalendar.currentCalendar().dateFromComponents(component)?.timeIntervalSince1970)!)
    }
    
    convenience init?(dateString : String, format : String) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        self.init(timeIntervalSince1970 : (dateFormatter.dateFromString(dateString)?.timeIntervalSince1970)!)
    }
    
    func getDate(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int{
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self).day
    }
    
    func getUTCDate() -> Int {
        return self.getDate(NSTimeZone(name: "UTC")!)
    }
    
    func getDay(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self).weekday
    }
    
    func getUTCDay() -> Int {
        return self.getDay(NSTimeZone(name: "UTC")!)
    }
    
    func getFullYear(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self).year
    }

    func getUTCFullYear() -> Int {
        return self.getFullYear(NSTimeZone(name: "UTC")!)
    }
    
    func getMonth(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self).month
    }

    func getUTCMonth() -> Int {
        return self.getMonth(NSTimeZone(name: "UTC")!)
    }
    
    func getHours(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self).hour
    }

    func getUTCHours(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return self.getHours(NSTimeZone(name: "UTC")!)
    }
    
    func getMinutes(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self).hour
    }
    
    func getUTCMinutes(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return self.getMinutes(NSTimeZone(name: "UTC")!)
    }
    
    func getSeconds(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self).second
    }
    
    func getUTCSeconds(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return self.getSeconds(NSTimeZone(name: "UTC")!)
    }
   
    func getWeekOfMonth(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self).weekOfMonth
    }
    
    func getWeekOfMonth() -> Int {
        return self.getWeekOfMonth(NSTimeZone(name: "UTC")!)
    }
    
    func getWeekOfYear(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self).weekOfYear
    }

    func getUTCWeekOfYear() -> Int {
        return self.getWeekOfYear(NSTimeZone(name: "UTC")!)
    }
    
    func getDayOfYear(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        let calendar = NSCalendar.currentCalendar()
        calendar.timeZone = timezone
        return calendar.ordinalityOfUnit(.Day, inUnit: .Year, forDate: self)
    }
    
    func getUTCDayOfYear() -> Int {
        return self.getDayOfYear(NSTimeZone(name: "UTC")!)
    }

    func addSeconds(seconds : Int) -> NSDate {
        return NSCalendar.currentCalendar().dateByAddingUnit(
            .Second, value: seconds, toDate: self,
            options: NSCalendarOptions(rawValue: 0))!
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
    
    func toDateString(style : NSDateFormatterStyle = .MediumStyle) -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = style
        return formatter.stringFromDate(self)
    }

    func toDateString(style : NSDateFormatterStyle, timezone : NSTimeZone) -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = style
        formatter.timeZone = timezone
        return formatter.stringFromDate(self)
    }
    
    func toTimeString(style : NSDateFormatterStyle = .ShortStyle) -> String {
        let formatter = NSDateFormatter()
        formatter.timeStyle = style
        return formatter.stringFromDate(self)
    }

    func toTimeString(style : NSDateFormatterStyle, timezone : NSTimeZone) -> String {
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
NSDate(year: 2012, month: 11, day: 15)

NSDate().getDay()
NSDate().getUTCDay()

NSDate().getDate()
NSDate().getUTCDate()

NSDate().getHours()
NSDate().getUTCHours()

NSDate().getMinutes()
NSDate().getUTCMinutes()

NSDate().toDateString()
NSDate().toDateString(.LongStyle)

NSDate().toTimeString()
NSDate().toTimeString(.MediumStyle)

NSDate().getDayOfYear()
NSDate().getUTCDayOfYear()

NSDate().addDays(1)
NSDate().addMonths(1)
NSDate().addYears(1)
NSDate().addMinutes(45)
NSDate().addHours(2)

NSDate().getTime()

NSDate().getComponentsWithTimeZone().day
NSDate().getComponentsWithTimeZone(NSTimeZone(name: "Asia/Kuala_Lumpur")!).day

NSDate().between(NSDate().addMonths(1),units :NSCalendarUnit.Hour).day

