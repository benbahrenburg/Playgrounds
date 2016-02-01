//: IANA Timezone and other date experiments

import UIKit

//https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
let listOfAllTimezoneNames = ["Africa/Asmera","Africa/Timbuktu","America/Argentina/ComodRivadavia","America/Atka","America/Buenos_Aires","America/Catamarca","America/Coral_Harbour","America/Cordoba","America/Ensenada","America/Fort_Wayne","America/Indianapolis","America/Jujuy","America/Knox_IN","America/Louisville","America/Mendoza","America/Montreal","America/Porto_Acre","America/Rosario","America/Shiprock","America/Virgin","Antarctica/South_Pole","Asia/Ashkhabad","Asia/Calcutta","Asia/Chongqing","Asia/Chungking","Asia/Dacca","Asia/Harbin","Asia/Istanbul","Asia/Kashgar","Asia/Katmandu","Asia/Macao","Asia/Saigon","Asia/Tel_Aviv","Asia/Thimbu","Asia/Ujung_Pandang","Asia/Ulan_Bator","Atlantic/Faeroe","Atlantic/Jan_Mayen","Australia/ACT","Australia/Canberra","Australia/LHI","Australia/North","Australia/NSW","Australia/Queensland","Australia/South","Australia/Tasmania","Australia/Victoria","Australia/West","Australia/Yancowinna","Brazil/Acre","Brazil/DeNoronha","Brazil/East","Brazil/West","Canada/Atlantic","Canada/Central","Canada/East-Saskatchewan","Canada/Eastern","Canada/Mountain","Canada/Newfoundland","Canada/Pacific","Canada/Saskatchewan","Canada/Yukon","CET","Chile/Continental","Chile/EasterIsland","CST6CDT","Cuba","EET","Egypt","Eire","EST","EST5EDT","Etc/GMT","Etc/GMT+0","Etc/GMT+1","Etc/GMT+10","Etc/GMT+11","Etc/GMT+12","Etc/GMT+2","Etc/GMT+3","Etc/GMT+4","Etc/GMT+5","Etc/GMT+6","Etc/GMT+7","Etc/GMT+8","Etc/GMT+9","Etc/GMT-0","Etc/GMT-1","Etc/GMT-10","Etc/GMT-11","Etc/GMT-12","Etc/GMT-13","Etc/GMT-14","Etc/GMT-2","Etc/GMT-3","Etc/GMT-4","Etc/GMT-5","Etc/GMT-6","Etc/GMT-7","Etc/GMT-8","Etc/GMT-9","Etc/GMT0","Etc/Greenwich","Etc/UCT","Etc/Universal","Etc/UTC","Etc/Zulu","Europe/Belfast","Europe/Nicosia","Europe/Tiraspol","GB","GB-Eire","GMT","GMT+0","GMT-0","GMT0","Greenwich","Hongkong","HST","Iceland","Iran","Israel","Jamaica","Japan","Kwajalein","Libya","MET","Mexico/BajaNorte","Mexico/BajaSur","Mexico/General","MST","MST7MDT","Navajo","NZ","NZ-CHAT","Pacific/Ponape","Pacific/Samoa","Pacific/Truk","Pacific/Yap","Poland","Portugal","PRC","PST8PDT","ROC","ROK","Singapore","Turkey","UCT","Universal","US/Alaska","US/Aleutian","US/Arizona","US/Central","US/East-Indiana","US/Eastern","US/Hawaii","US/Indiana-Starke","US/Michigan","US/Mountain","US/Pacific","US/Pacific-New","US/Samoa","UTC","W-SU","WET","Zulu","Europe/Andorra","Asia/Dubai","Asia/Kabul","America/Antigua","America/Anguilla","Europe/Tirane","Asia/Yerevan","Africa/Luanda","Antarctica/Casey","Antarctica/Davis","Antarctica/DumontDUrville","Antarctica/Mawson","Antarctica/McMurdo","Antarctica/Palmer","Antarctica/Rothera","Antarctica/Syowa","Antarctica/Troll","Antarctica/Vostok","America/Argentina/Buenos_Aires","America/Argentina/Catamarca","America/Argentina/Cordoba","America/Argentina/Jujuy","America/Argentina/La_Rioja","America/Argentina/Mendoza","America/Argentina/Rio_Gallegos","America/Argentina/Salta","America/Argentina/San_Juan","America/Argentina/San_Luis","America/Argentina/Tucuman","America/Argentina/Ushuaia","Pacific/Pago_Pago","Europe/Vienna","Antarctica/Macquarie","Australia/Adelaide","Australia/Brisbane","Australia/Broken_Hill","Australia/Currie","Australia/Darwin","Australia/Eucla","Australia/Hobart","Australia/Lindeman","Australia/Lord_Howe","Australia/Melbourne","Australia/Perth","Australia/Sydney","America/Aruba","Europe/Mariehamn","Asia/Baku","Europe/Sarajevo","America/Barbados","Asia/Dhaka","Europe/Brussels","Africa/Ouagadougou","Europe/Sofia","Asia/Bahrain","Africa/Bujumbura","Africa/Porto-Novo","America/St_Barthelemy","Atlantic/Bermuda","Asia/Brunei","America/La_Paz","America/Kralendijk","America/Araguaina","America/Bahia","America/Belem","America/Boa_Vista","America/Campo_Grande","America/Cuiaba","America/Eirunepe","America/Fortaleza","America/Maceio","America/Manaus","America/Noronha","America/Porto_Velho","America/Recife","America/Rio_Branco","America/Santarem","America/Sao_Paulo","America/Nassau","Asia/Thimphu","Africa/Gaborone","Europe/Minsk","America/Belize","America/Atikokan","America/Blanc-Sablon","America/Cambridge_Bay","America/Creston","America/Dawson","America/Dawson_Creek","America/Edmonton","America/Fort_Nelson","America/Glace_Bay","America/Goose_Bay","America/Halifax","America/Inuvik","America/Iqaluit","America/Moncton","America/Nipigon","America/Pangnirtung","America/Rainy_River","America/Rankin_Inlet","America/Regina","America/Resolute","America/St_Johns","America/Swift_Current","America/Thunder_Bay","America/Toronto","America/Vancouver","America/Whitehorse","America/Winnipeg","America/Yellowknife","Indian/Cocos","Africa/Kinshasa","Africa/Lubumbashi","Africa/Bangui","Africa/Brazzaville","Europe/Zurich","Africa/Abidjan","Pacific/Rarotonga","America/Santiago","Pacific/Easter","Africa/Douala","Asia/Shanghai","Asia/Urumqi","America/Bogota","America/Costa_Rica","America/Havana","Atlantic/Cape_Verde","America/Curacao","Indian/Christmas","Asia/Nicosia","Europe/Prague","Europe/Berlin","Europe/Busingen","Africa/Djibouti","Europe/Copenhagen","America/Dominica","America/Santo_Domingo","Africa/Algiers","America/Guayaquil","Pacific/Galapagos","Europe/Tallinn","Africa/Cairo","Africa/El_Aaiun","Africa/Asmara","Africa/Ceuta","Atlantic/Canary","Europe/Madrid","Africa/Addis_Ababa","Europe/Helsinki","Pacific/Fiji","Atlantic/Stanley","Pacific/Chuuk","Pacific/Kosrae","Pacific/Pohnpei","Atlantic/Faroe","Europe/Paris","Africa/Libreville","Europe/London","America/Grenada","Asia/Tbilisi","America/Cayenne","Europe/Guernsey","Africa/Accra","Europe/Gibraltar","America/Danmarkshavn","America/Godthab","America/Scoresbysund","America/Thule","Africa/Banjul","Africa/Conakry","America/Guadeloupe","Africa/Malabo","Europe/Athens","Atlantic/South_Georgia","America/Guatemala","Pacific/Guam","Africa/Bissau","America/Guyana","Asia/Hong_Kong","America/Tegucigalpa","Europe/Zagreb","America/Port-au-Prince","Europe/Budapest","Asia/Jakarta","Asia/Jayapura","Asia/Makassar","Asia/Pontianak","Europe/Dublin","Asia/Jerusalem","Europe/Isle_of_Man","Asia/Kolkata","Indian/Chagos","Asia/Baghdad","Asia/Tehran","Atlantic/Reykjavik","Europe/Rome","Europe/Jersey","America/Jamaica","Asia/Amman","Asia/Tokyo","Africa/Nairobi","Asia/Bishkek","Asia/Phnom_Penh","Pacific/Enderbury","Pacific/Kiritimati","Pacific/Tarawa","Indian/Comoro","America/St_Kitts","Asia/Pyongyang","Asia/Seoul","Asia/Kuwait","America/Cayman","Asia/Almaty","Asia/Aqtau","Asia/Aqtobe","Asia/Oral","Asia/Qyzylorda","Asia/Vientiane","Asia/Beirut","America/St_Lucia","Europe/Vaduz","Asia/Colombo","Africa/Monrovia","Africa/Maseru","Europe/Vilnius","Europe/Luxembourg","Europe/Riga","Africa/Tripoli","Africa/Casablanca","Europe/Monaco","Europe/Chisinau","Europe/Podgorica","America/Marigot","Indian/Antananarivo","Pacific/Kwajalein","Pacific/Majuro","Europe/Skopje","Africa/Bamako","Asia/Rangoon","Asia/Choibalsan","Asia/Hovd","Asia/Ulaanbaatar","Asia/Macau","Pacific/Saipan","America/Martinique","Africa/Nouakchott","America/Montserrat","Europe/Malta","Indian/Mauritius","Indian/Maldives","Africa/Blantyre","America/Bahia_Banderas","America/Cancun","America/Chihuahua","America/Hermosillo","America/Matamoros","America/Mazatlan","America/Merida","America/Mexico_City","America/Monterrey","America/Ojinaga","America/Santa_Isabel","America/Tijuana","Asia/Kuala_Lumpur","Asia/Kuching","Africa/Maputo","Africa/Windhoek","Pacific/Noumea","Africa/Niamey","Pacific/Norfolk","Africa/Lagos","America/Managua","Europe/Amsterdam","Europe/Oslo","Asia/Kathmandu","Pacific/Nauru","Pacific/Niue","Pacific/Auckland","Pacific/Chatham","Asia/Muscat","America/Panama","America/Lima","Pacific/Gambier","Pacific/Marquesas","Pacific/Tahiti","Pacific/Bougainville","Pacific/Port_Moresby","Asia/Manila","Asia/Karachi","Europe/Warsaw","America/Miquelon","Pacific/Pitcairn","America/Puerto_Rico","Asia/Gaza","Asia/Hebron","Atlantic/Azores","Atlantic/Madeira","Europe/Lisbon","Pacific/Palau","America/Asuncion","Asia/Qatar","Indian/Reunion","Europe/Bucharest","Europe/Belgrade","Asia/Anadyr","Asia/Chita","Asia/Irkutsk","Asia/Kamchatka","Asia/Khandyga","Asia/Krasnoyarsk","Asia/Magadan","Asia/Novokuznetsk","Asia/Novosibirsk","Asia/Omsk","Asia/Sakhalin","Asia/Srednekolymsk","Asia/Ust-Nera","Asia/Vladivostok","Asia/Yakutsk","Asia/Yekaterinburg","Europe/Kaliningrad","Europe/Moscow","Europe/Samara","Europe/Volgograd","Africa/Kigali","Asia/Riyadh","Pacific/Guadalcanal","Indian/Mahe","Africa/Khartoum","Europe/Stockholm","Asia/Singapore","Atlantic/St_Helena","Europe/Ljubljana","Arctic/Longyearbyen","Europe/Bratislava","Africa/Freetown","Europe/San_Marino","Africa/Dakar","Africa/Mogadishu","America/Paramaribo","Africa/Juba","Africa/Sao_Tome","America/El_Salvador","America/Lower_Princes","Asia/Damascus","Africa/Mbabane","America/Grand_Turk","Africa/Ndjamena","Indian/Kerguelen","Africa/Lome","Asia/Bangkok","Asia/Dushanbe","Pacific/Fakaofo","Asia/Dili","Asia/Ashgabat","Africa/Tunis","Pacific/Tongatapu","Europe/Istanbul","America/Port_of_Spain","Pacific/Funafuti","Asia/Taipei","Africa/Dar_es_Salaam","Europe/Kiev","Europe/Simferopol","Europe/Uzhgorod","Europe/Zaporozhye","Africa/Kampala","Pacific/Johnston","Pacific/Midway","Pacific/Wake","America/Adak","America/Anchorage","America/Boise","America/Chicago","America/Denver","America/Detroit","America/Indiana/Indianapolis","America/Indiana/Knox","America/Indiana/Marengo","America/Indiana/Petersburg","America/Indiana/Tell_City","America/Indiana/Vevay","America/Indiana/Vincennes","America/Indiana/Winamac","America/Juneau","America/Kentucky/Louisville","America/Kentucky/Monticello","America/Los_Angeles","America/Menominee","America/Metlakatla","America/New_York","America/Nome","America/North_Dakota/Beulah","America/North_Dakota/Center","America/North_Dakota/New_Salem","America/Phoenix","America/Sitka","America/Yakutat","Pacific/Honolulu","America/Montevideo","Asia/Samarkand","Asia/Tashkent","Europe/Vatican","America/St_Vincent","America/Caracas","America/Tortola","America/St_Thomas","Asia/Ho_Chi_Minh","Pacific/Efate","Pacific/Wallis","Pacific/Apia","Asia/Aden","Indian/Mayotte","Africa/Johannesburg","Africa/Lusaka","Africa/Harare"]

//Get a list of all timezones iOS supports
let supportedTimeZones = NSTimeZone.knownTimeZoneNames()

//Loop through each
for timezone in supportedTimeZones {
    print(timezone)
}

//Loop through all of the IANA timzones
for tz in listOfAllTimezoneNames {
    print(tz)
}

extension String {
    func contains(find: String) -> Bool{
        return self.rangeOfString(find) != nil
    }
}

//Loop through all of the IANA timezone
//and check if iOS supprots
for tz in listOfAllTimezoneNames {
    //Make an assumption all IANA timezones will
    //contain a /, not always true, but good for testing
    if(tz.contains("/")){
        if(!supportedTimeZones.contains(tz)) {
            print(tz + " not supported")
        }
    }
}

//Let's create NSTimeZone object using a random IANA code
let timeZone = NSTimeZone(name: "Asia/Kuala_Lumpur")
//What is the abbreviation
timeZone?.abbreviation
//Get the description with everything
timeZone?.description

//Assemble everything so we can get a formatted time for that timezone
let now = NSDate();
let formatter = NSDateFormatter()
formatter.timeZone = timeZone
formatter.timeStyle = .ShortStyle
formatter.stringFromDate(now)

//Wrap this into a method we can use
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


