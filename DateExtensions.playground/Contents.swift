//: SwiftDately comprehensive, lightweight date extensions for Swift

import UIKit

extension Date {
    
    init?(year : Int, month : Int? = nil, day : Int? = nil,
        hours : Int? = nil, minutes : Int? = nil, seconds : Int? = nil,
        timeZone : TimeZone? = nil)
    {
        let tz = timeZone ?? TimeZone.autoupdatingCurrent
        var components = Date().getComponents(tz)
        components.year = year
        components.month = month ?? components.month
        components.day = day ?? components.day
        components.hour = hours ?? components.hour
        components.minute = minutes ?? components.month
        components.second = seconds ?? components.second
        
        
        self.init(timeIntervalSince1970: (Calendar.current.date(from: components)?.timeIntervalSince1970)!)
    }

    init?(dateString : String, format : String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        self.init(timeIntervalSince1970 : (dateFormatter.date(from: dateString)?.timeIntervalSince1970)!)
    }

    fileprivate func getCalendar() -> Calendar {
        return self.getCalendar(TimeZone.autoupdatingCurrent)
    }
    
    fileprivate func getCalendar(_ timeZone : TimeZone) -> Calendar {
        var calendar = Calendar.current
        calendar.timeZone = timeZone
        return calendar
    }

    fileprivate func getComponents() -> DateComponents {
        return self.getComponents(TimeZone.autoupdatingCurrent)
    }

    fileprivate func getComponents(_ timeZone : TimeZone) -> DateComponents {
        return (self.getCalendar(timeZone) as NSCalendar).components([.year, .month, .weekday, .day, .hour, .minute, .second], from: self)
    }
    
    func get(_ unit: NSCalendar.Unit, inUnit: NSCalendar.Unit, timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Int {
        return (self.getCalendar(timeZone) as NSCalendar).ordinality(of: unit, in: inUnit, for: self)
    }
    
    func set(timeZone : TimeZone? = nil,
        year: Int? = nil, month: Int? = nil, day: Int? = nil,
        hour: Int? = nil, minute: Int? = nil, second: Int? = nil) -> Date
    {
        let tz = timeZone ?? TimeZone.autoupdatingCurrent
        let calendar = self.getCalendar(tz)
        var components = (calendar as NSCalendar).components([.year, .month, .weekday, .day, .hour, .minute, .second], from: self)
        components.year = year ?? self.year(tz)
        components.month = month ?? self.month(tz)
        components.day = day ?? self.day(tz)
        components.hour = hour ?? self.hours(tz)
        components.minute = minute ?? self.minutes(tz)
        components.second = second ?? self.seconds(tz)
        return calendar.date(from: components)!
    }
    
    func day(_ timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Int {
        return Calendar.current.dateComponents(in: timeZone, from: self).day!
    }
    
    func setDay(_ value : Int, timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Date {
        return self.set(timeZone:timeZone, day:value)
    }
    
    func year(_ timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Int {
        return Calendar.current.dateComponents(in: timeZone, from: self).year!
    }
    
    func setYear(_ value : Int, timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Date {
        return self.set(timeZone:timeZone, year:value)
    }
    
    func month(_ timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Int {
        return self.get(.month, inUnit: .year, timeZone: timeZone)
    }
  
    func setMonth(_ value : Int, timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Date {
        return self.set(timeZone:timeZone, month:value)
    }
    
    func hours(_ timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Int {
        return self.get(.hour, inUnit: .day, timeZone: timeZone)
    }
  
    func setHours(_ value : Int, timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Date {
        return self.set(timeZone:timeZone, hour:value)
    }
    
    func minutes(_ timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Int {
        return self.get(.minute, inUnit: .hour, timeZone: timeZone)
    }
    
    func setMinutes(_ value : Int, timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Date {
        return self.set(timeZone:timeZone, minute:value)
    }
    
    func seconds(_ timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Int {
       return self.get(.second, inUnit: .minute, timeZone: timeZone)
    }
    
    func setSeconds(_ value : Int, timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Date {
        return self.set(timeZone:timeZone, second:value)
    }
   
    func dayInMonth(_ timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Int{
        return self.get(.day, inUnit: .month, timeZone: timeZone)
    }

    func dayOfWeek(_ timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Int {
        return self.getCalendar(timeZone).dateComponents(in: timeZone, from: self).weekday!
    }
    
    func weekOfMonth(_ timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Int {
        return self.get(.weekOfMonth, inUnit: .month, timeZone: timeZone)
    }
    
    func getWeekOfYear(_ timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Int {
        return self.getCalendar(timeZone).dateComponents(in: timeZone, from: self).weekOfYear!
    }
    
    func dayOfYear(_ timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Int {
        return self.get(.day, inUnit: .year, timeZone: timeZone)
    }
    
    func add(_ unit : NSCalendar.Unit, amount : Int) -> Date {
        return (self.getCalendar() as NSCalendar).date(
            byAdding: unit, value: amount, to: self,
            options: NSCalendar.Options(rawValue: 0))!
    }
    
    func subtract(_ unit : NSCalendar.Unit, amount : Int) -> Date {
        return self.add(unit, amount: (amount * -1))
    }
    
    func getTime() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    func tomorrow(_ timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Date {
        return self.add(.day, amount: 1).set(timeZone:timeZone, hour:0, minute:0, second:0)
    }
    
    func yesterday(_ timeZone : TimeZone = TimeZone.autoupdatingCurrent)->Date {
        return self.subtract(.day, amount: 1).set(timeZone:timeZone, hour:0, minute:0, second:0)
    }
    
    func between(_ toDate : Date, units : NSCalendar.Unit = [NSCalendar.Unit.day] ) -> DateComponents {
        return (self.getCalendar() as NSCalendar).components(units, from: self, to: toDate, options: [])
    }
 
    func isSameDay(_ compareDate: Date,timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Bool {
        let comp1 = (self.getCalendar(timeZone) as NSCalendar).components([.year, .month, .weekday, .day], from: self)
        let comp2 = (self.getCalendar(timeZone) as NSCalendar).components([.year, .month, .weekday, .day], from: compareDate)
        return ((comp1.year == comp2.year) && (comp1.month == comp2.month) && (comp1.day == comp2.day))
    }
    
    public func isGreaterThan(_ date: Date) -> Bool {
        return (self.compare(date) == .orderedDescending)
    }
    
    public func isLessThan(_ date: Date) -> Bool {
        return (self.compare(date) == .orderedAscending)
    }
    
    func daysInMonth () -> Int {
        return (Calendar.current as NSCalendar).range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: self).length
    }
   
    func beginningOfMonth(_ timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Date {
        var components = self.getComponents(timeZone)
        components.day = 1
        return self.getCalendar(timeZone).date(from: components)!
    }
    
    func endOfMonth(_ timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Date {
        var components = self.getComponents(timeZone)
        components.month = components.month! + 1
        components.day = 0
        return self.getCalendar(timeZone).date(from: components)!
    }

    func beginningOfWeek(_ timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Date {
        let calendar = self.getCalendar(timeZone)
        let flags :NSCalendar.Unit = [NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.weekOfYear, NSCalendar.Unit.weekday]
        var components = (calendar as NSCalendar).components(flags, from: self)
        components.weekday = calendar.firstWeekday
        components.hour = 0
        components.minute = 0
        components.second = 0
        return calendar.date(from: components)!
    }

    func endOfWeek(_ timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> Date {
        let calendar = self.getCalendar(timeZone)
        let flags :NSCalendar.Unit = [NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.weekOfYear, NSCalendar.Unit.weekday]
        var components = (calendar as NSCalendar).components(flags, from: self)
        components.weekday = calendar.firstWeekday + 6
        components.hour = 0
        components.minute = 0
        components.second = 0
        return calendar.date(from: components)!
    }
 
    func formatDate(_ style : DateFormatter.Style, timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        formatter.timeZone = timeZone
        return formatter.string(from: self)
    }
    
    func formatTime(_ style : DateFormatter.Style, timeZone : TimeZone = TimeZone.autoupdatingCurrent) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = style
        formatter.timeZone = timeZone
        return formatter.string(from: self)
    }
    
    func toString(dateStyle: DateFormatter.Style = .full, timeStyle: DateFormatter.Style = .long,
        doesRelativeDateFormatting: Bool = false, timeZone : TimeZone = TimeZone.autoupdatingCurrent,
        locale : Locale = Locale.current ) -> String
    {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        formatter.doesRelativeDateFormatting = doesRelativeDateFormatting
        formatter.timeZone = timeZone
        formatter.locale = locale
        return formatter.string(from: self)
    }
    
    func toString(_ formatString : String, timeZone : TimeZone = TimeZone.autoupdatingCurrent, locale : Locale = Locale.current ) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = formatString
        formatter.timeZone = timeZone
        formatter.locale = locale
        return formatter.string(from: self)
    }
    
    func dayName() -> String {
        return DateFormatter().weekdaySymbols[self.dayOfWeek()-1] as String
    }

    func dayAbbreviation() -> String {
        return DateFormatter().shortWeekdaySymbols[self.dayOfWeek()-1] as String
    }
 
    func monthName() -> String {
        return DateFormatter().monthSymbols[self.month()-1] as String
    }
    
    func monthAbbreviation() -> String {
        return DateFormatter().shortMonthSymbols[self.month()-1] as String
    }
    
    func fromNow()->String {
        
        let seconds =   Date().timeIntervalSince1970 - self.timeIntervalSince1970
        let isInPast = (seconds > 0 )
        let secs = abs(seconds)
        
        if (secs < 60) {
            return NSLocalizedString("just now", comment: "Show the relative time from a date")
        }

        let minutes = round(secs/60)
        
        if minutes == 1 {
            let template =  NSLocalizedString((isInPast ? "1 minute ago" : "in 1 minute"),
                comment: "Show the relative time from a date")
            return String(format: template)
        }
        
        if minutes < 60 {
            let template = NSLocalizedString((isInPast ? "%.f minutes ago" : "in %.f minutes"),
                comment: "Show the relative time from a date")
            return String(format: template, minutes)
        }

        let hours = round(minutes/60)
        
        if hours == 1 {
            return NSLocalizedString(((isInPast) ? "1 hour ago" : "in 1 hour"),
                comment: "Show the relative time from a date")
        }
        
        if hours < 24 {
            let template = NSLocalizedString((isInPast ? "%.f hours ago" : "in %.f hours"),
                comment: "Show the relative time from a date")
            return String(format: template, hours)
        }

        let days = round(hours/24)
        
        if days == 1 {
            return NSLocalizedString(((isInPast) ? "1 day ago" : "in 1 day"),
                comment: "Show the relative time from a date")
        }
       
        let nowComp = (Calendar.current as NSCalendar).components([.weekOfYear, .month, .year],from: Date())
        let dateComp = (Calendar.current as NSCalendar).components([.weekOfYear, .month, .year],from: self)
        let isSameYear = nowComp.year == dateComp.year
        let weekDiff = abs(nowComp.weekOfYear! - dateComp.weekOfYear!)
        
        if ((weekDiff == 0) && (isSameYear)) {
            return NSLocalizedString("this week",
                comment: "Show the relative time from a date")
        }
        
        if ((weekDiff == 1) && (isSameYear)) {
            return NSLocalizedString((isInPast ? "last week" : "next week"),
                comment: "Show the relative time from a date")
        }

        let monthDiff = abs(nowComp.month! - dateComp.month!)
        
        if ((monthDiff == 0) && (days <= 31) && (isSameYear)) {
            let template = NSLocalizedString((isInPast ? "%.i days ago": "in %.i days"),
                comment: "Show the relative time from a date")
            return String(format: template, days)
        }
        
        if ((monthDiff == 1) && (isSameYear)) {
            return NSLocalizedString((isInPast ? "last month" : "next month"),
                comment: "Show the relative time from a date")
        }
        
        if ((monthDiff <= 12) && (isSameYear)) {
            let template = NSLocalizedString((isInPast ? "%.f months ago" :"in %.i months"),
                comment: "Show the relative time from a date")
            return String(format: template, monthDiff)
        }
        
        if abs(nowComp.year! - dateComp.year!) == 1 {
            return NSLocalizedString((isInPast ? "last year" : "in a year"), comment: "Show the relative time from a date")
        }
        
        return NSLocalizedString((isInPast ? "years ago" : "in years"),
            comment: "Show the relative time from a date")
        
    }
    
}

Date().dayName()
Date().dayAbbreviation()
Date().monthAbbreviation()
Date().monthName()

Date().toString()
Date().beginningOfMonth()
Date().endOfMonth()
Date().daysInMonth()
Date().beginningOfWeek()
Date().endOfWeek()

Date(dateString: "2013-09-29T18:46:19-0700", format: "yyyy-MM-dd'T'HH:mm:ssZ")
Date(year: 2012, month: 11, day: 15)

Date().day()
Date().day(TimeZone(identifier: "UTC")!)


Date().hours()
Date().hours(TimeZone(identifier: "UTC")!)

Date().minutes()
Date().minutes(TimeZone(identifier: "UTC")!)

Date().formatDate(.long)
Date().formatTime(.medium)

Date().dayOfWeek()

Date().dayOfYear()
Date().dayOfYear(TimeZone(identifier: "UTC")!)

Date().add(.day,amount: 1)
Date().add(.month,amount: 1)
Date().add(.year,amount: 1)
Date().add(.minute,amount:45)
Date().add(.hour,amount:2)

Date().getTime()

Date().between(Date().add(.month,amount: 1),units :NSCalendar.Unit.hour).day

Date().setYear(2020)
Date().setMonth(10)
Date().setDay(1)
Date().setHours(1)

Date().setYear(2000).fromNow()
Date().setMonth(1).fromNow()
Date().setDay(1).fromNow()
Date().setHours(2).fromNow()

Date().setYear(2020).fromNow()
Date().setMonth(10).fromNow()
Date().setDay(18).fromNow()
Date().setHours(18).fromNow()



let stringDate = "2016-02-17T09:01:24.0025295Z"
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSS'Z'"
let expireTime = dateFormatter.date(from: stringDate)


