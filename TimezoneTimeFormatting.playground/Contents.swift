//: Formatting Time across timezones

import UIKit

/***************************************************************************************/
// How do we display the time in a specific timezone?
/***************************************************************************************/

//Let's start with just printing a date associated with a timezone
let formatter = NSDateFormatter()
formatter.timeZone = NSTimeZone(name: "Asia/Kuala_Lumpur")
formatter.timeStyle = .ShortStyle
formatter.stringFromDate(NSDate())

//Wrap this all up into a method
func getTimezoneCurrentTime(timezone : String) ->String {
    let formatter = NSDateFormatter()
    formatter.timeZone = NSTimeZone(name: timezone)
    formatter.timeStyle = .ShortStyle
    return formatter.stringFromDate(NSDate()) + " " + (formatter.timeZone?.abbreviation)!
}

//Test to see if our time with timezone is printed correctly
let firstTest = getTimezoneCurrentTime("Asia/Kuala_Lumpur")

/***************************************************************************************/
//What happens if the provided timezone results the time being in a different day?
/***************************************************************************************/

//First let's check what day it is in our timezone
//Check the day for the provided timezone
let thereTest = NSCalendar.currentCalendar().componentsInTimeZone(NSTimeZone(name: "Asia/Kuala_Lumpur")!, fromDate: NSDate()).day

//Now check the day for the local timezone
let hereTest = NSCalendar.currentCalendar().componentsInTimeZone(NSTimeZone.localTimeZone(), fromDate: NSDate()).day

//Now we can do a simple compare to check if we need to provide day info
thereTest == hereTest


//Let's now create a new method to return the proper time
//with the month and day if the day is different between the timezones
func getFormattedTime(timezone : String, dateFromat : String = "MMM dd") ->String {
    let now = NSDate(); //Get current time
    let tz = NSTimeZone(name: timezone) // Create our timezone

    //Get the day as it relates to the provided timezone
    let tzDay = NSCalendar.currentCalendar().componentsInTimeZone(tz!, fromDate: now).day
    //Get the current day as it relates to local time
    let localDay = NSCalendar.currentCalendar().componentsInTimeZone(NSTimeZone.localTimeZone(), fromDate: now).day
    
    //Build our time formatter
    let timeFormatter = NSDateFormatter()
    timeFormatter.timeZone = tz
    timeFormatter.timeStyle = .ShortStyle
    
    //If in the same day, return the time
    if(tzDay == localDay){
        
        //Return formated time with timezone abb
        return String(format: "%@ %@", timeFormatter.stringFromDate(now), (tz?.abbreviation)!)
        
    } else {
        
        //If the day is not the same include the month and day
        let dayFormatter = NSDateFormatter()
        dayFormatter.timeZone = tz
        dayFormatter.dateFormat = dateFromat
        
        return String(format: "%@ %@ (%@)", timeFormatter.stringFromDate(now), (tz?.abbreviation)!,dayFormatter.stringFromDate(now))
    }
}

let test2 = getFormattedTime("Asia/Kuala_Lumpur")
