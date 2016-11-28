//: Formatting Time across timezones

import UIKit

/***************************************************************************************/
// How do we display the time in a specific timezone?
/***************************************************************************************/

//Let's start with just printing a date associated with a timezone
let formatter = DateFormatter()
formatter.timeZone = TimeZone(identifier: "Asia/Kuala_Lumpur")
formatter.timeStyle = .short
formatter.string(from: Date())

//Wrap this all up into a method
func getTimezoneCurrentTime(_ timezone : String) ->String {
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone(identifier: timezone)
    formatter.timeStyle = .short
    return formatter.string(from: Date()) + " " + (formatter.timeZone?.abbreviation())!
}

//Test to see if our time with timezone is printed correctly
let firstTest = getTimezoneCurrentTime("Asia/Kuala_Lumpur")

/***************************************************************************************/
//What happens if the provided timezone results the time being in a different day?
/***************************************************************************************/

//First let's check what day it is in our timezone
//Check the day for the provided timezone
let thereTest = Calendar.current.dateComponents(in: TimeZone(identifier: "Asia/Kuala_Lumpur")!, from: Date()).day

//Now check the day for the local timezone
let hereTest = Calendar.current.dateComponents(in: TimeZone.autoupdatingCurrent, from: Date()).day

//Now we can do a simple compare to check if we need to provide day info
thereTest == hereTest


//Let's now create a new method to return the proper time
//with the month and day if the day is different between the timezones
func getFormattedTime(_ timezone : String, dateFromat : String = "MMM dd") ->String {
    let now = Date(); //Get current time
    let tz = TimeZone(identifier: timezone) // Create our timezone

    //Get the day as it relates to the provided timezone
    let tzDay = Calendar.current.dateComponents(in: tz!, from: now).day
    //Get the current day as it relates to local time
    let localDay = Calendar.current.dateComponents(in: TimeZone.autoupdatingCurrent, from: now).day
    
    //Build our time formatter
    let timeFormatter = DateFormatter()
    timeFormatter.timeZone = tz
    timeFormatter.timeStyle = .short
    
    //If in the same day, return the time
    if(tzDay == localDay){
        //Return formated time with timezone abb
        return String(format: "%@ %@", timeFormatter.string(from: now), (tz?.abbreviation())!)
        
    } else {
        
        //If the day is not the same include the month and day
        let dayFormatter = DateFormatter()
        dayFormatter.timeZone = tz
        dayFormatter.dateFormat = dateFromat
        
        return String(format: "%@ %@ (%@)", timeFormatter.string(from: now), (tz?.abbreviation())!,dayFormatter.string(from: now))
    }
}

let test2 = getFormattedTime("Asia/Kuala_Lumpur")
let test3 = getFormattedTime("America/New_York")
