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
    
    func getDay(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self).weekday
    }
    
    func getFullYear(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self).year
    }
    
    func getMonth(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self).month
    }
    
    func getHours(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self).hour
    }
    
    func getMinutes(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self).hour
    }
    
    func getSeconds(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self).second
    }
    
    func getWeekOfMonth(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self).weekOfMonth
    }
    
    func get(unit: NSCalendarUnit, inUnit: NSCalendarUnit,timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        let calendar = NSCalendar.currentCalendar()
        calendar.timeZone = timezone
        return calendar.ordinalityOfUnit(unit, inUnit: inUnit, forDate: self)
    }
    
    func getWeekOfYear(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return NSCalendar.currentCalendar().componentsInTimeZone(timezone, fromDate: self).weekOfYear
    }
    
    func getDayOfYear(timezone : NSTimeZone = NSTimeZone.localTimeZone()) -> Int {
        return self.get(.Day, inUnit: .Year, timezone: timezone)
    }
    
    func add(unit : NSCalendarUnit, amount : Int) -> NSDate {
        return NSCalendar.currentCalendar().dateByAddingUnit(
            unit, value: amount, toDate: self,
            options: NSCalendarOptions(rawValue: 0))!
    }
    
    func subtract(unit : NSCalendarUnit, amount : Int) -> NSDate {
        return self.add(unit, amount: (amount * -1))
    }
    
    func getTime() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    func format(format : String) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(self)
    }
    
    func formatDate(style : NSDateFormatterStyle = .MediumStyle) -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = style
        return formatter.stringFromDate(self)
    }

    func formatDate(style : NSDateFormatterStyle, timezone : NSTimeZone) -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = style
        formatter.timeZone = timezone
        return formatter.stringFromDate(self)
    }
    
    func formatTime(style : NSDateFormatterStyle = .ShortStyle) -> String {
        let formatter = NSDateFormatter()
        formatter.timeStyle = style
        return formatter.stringFromDate(self)
    }

    func formatTime(style : NSDateFormatterStyle, timezone : NSTimeZone) -> String {
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
NSDate().getDay(NSTimeZone(name: "UTC")!)

NSDate().getDate()
NSDate().getDate(NSTimeZone(name: "UTC")!)

NSDate().getHours()
NSDate().getHours(NSTimeZone(name: "UTC")!)

NSDate().getMinutes()
NSDate().getMinutes(NSTimeZone(name: "UTC")!)

NSDate().formatDate()
NSDate().formatDate(.LongStyle)

NSDate().formatTime()
NSDate().formatTime(.MediumStyle)

NSDate().getDayOfYear()
NSDate().getDayOfYear(NSTimeZone(name: "UTC")!)

NSDate().add(.Day,amount: 1)
NSDate().add(.Month,amount: 1)
NSDate().add(.Year,amount: 1)
NSDate().add(.Minute,amount:45)
NSDate().add(.Hour,amount:2)

NSDate().getTime()

NSDate().getComponentsWithTimeZone().day
NSDate().getComponentsWithTimeZone(NSTimeZone(name: "Asia/Kuala_Lumpur")!).day

NSDate().between(NSDate()add(.Month,amount: 1),units :NSCalendarUnit.Hour).day

