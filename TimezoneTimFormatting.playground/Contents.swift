//: Formatting Time across timezones

import UIKit

//Let's start with just printing a date associated with a timezone
let now = NSDate();
let formatter = NSDateFormatter()
formatter.timeZone = NSTimeZone(name: "Asia/Kuala_Lumpur")
formatter.timeStyle = .ShortStyle
formatter.stringFromDate(now)

//Wrap this all up into a method
func getTimezoneCurrentTime(timezone : String) ->String {
    let now = NSDate();
    let tz = NSTimeZone(name: timezone)
    let formatter = NSDateFormatter()
    formatter.timeZone = tz
    formatter.timeStyle = .ShortStyle
    return formatter.stringFromDate(now) + " " + (tz?.abbreviation)!
}

let firstTest = getTimezoneCurrentTime("Asia/Kuala_Lumpur")

//How do we solve the problem of if the day is different then the local timezone?

//Create a calendar for a provided timezone
let tzCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
//Assign the timezone we are creating
tzCalendar?.timeZone = NSTimeZone(name: "Asia/Kuala_Lumpur")!
//Check the day for the provided timezone
tzCalendar!.components([NSCalendarUnit.Day], fromDate: now).day

//Now check the day for the local timezone
//Since no timezone is set it will use your local
NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!.components([NSCalendarUnit.Day], fromDate: now).day

//Let's now create a new method to return the proper time
//with the month and day if the day is different between the timezones
func getFormattedTime(timezone : String, dateFromat : String = "MMM dd") ->String {
    let now = NSDate(); //Get current time
    let tz = NSTimeZone(name: timezone) // Create our timezone

    //Build our time formatter
    let timeFormatter = NSDateFormatter()
    timeFormatter.timeZone = tz
    timeFormatter.timeStyle = .ShortStyle
    
    //Create a calendar object the current time using our timezone
    let tzCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
    //Assign the timezone
    tzCalendar?.timeZone = tz!
    //Get the day as it relates to the timezone
    let tzDay = tzCalendar!.components([NSCalendarUnit.Day], fromDate: now).day
    
    //Get the current day as it relates to local time
    let localDay = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!.components([NSCalendarUnit.Day], fromDate: now).day
    
    //If in the same day, return the time
    if(tzDay == localDay){
        return timeFormatter.stringFromDate(now) + " " + (tz?.abbreviation)!
    } else {
        //If the day is not the same include the month and day
        let dayFormatter = NSDateFormatter()
        dayFormatter.timeZone = tz
        dayFormatter.dateFormat = dateFromat
        return timeFormatter.stringFromDate(now) + " "
            + dayFormatter.stringFromDate(now) + " " + (tz?.abbreviation)!
    }
}

let test2 = getFormattedTime("Asia/Kuala_Lumpur")
