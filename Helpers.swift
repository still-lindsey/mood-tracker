//
//  Helpers.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import Foundation
import UIKit
import SwiftUI


func getDayOfMonth(date: String) -> String {
    var result = ""
    if date[6] == "0" {
        result = date[7]
    }else {
        result = "\(date[6])\(date[7])"
    }
    return result
}

func getListOfPreviousDates(date: Int) -> Array<Int> {
    var date = date
    var result = [Int]()
    var i = 7
    while i > 0 && date > 0 {
        result.append(date)
        date -= 1
        i -= 1
    }
    if result.count < 7{
        //get previous month days from 31,30, or 28
    }
    return result
}

func getMoodDescriptionandIcon(moodScore: Double) -> (String, UIImage?) {
    var resultDes: String
    var resultIcon: UIImage?
    if moodScore < 2 {
        resultDes = "really terrible"
        resultIcon = UIImage(named: "crying")
    }else if moodScore >= 2 && moodScore < 4{
        resultDes = "somewhat bad"
        resultIcon = UIImage(named: "sad")
    }else if moodScore >= 4 && moodScore < 6 {
        resultDes = "completely okay"
        resultIcon = UIImage(named: "neutral")
    }else if moodScore >= 6 && moodScore < 8{
        resultDes = "pretty good"
        resultIcon = UIImage(named: "smile")
    }else{
        resultDes = "super awesome"
        resultIcon = UIImage(named: "happy")
    }
    return (resultDes, resultIcon)
}

func getNumEntries(days: [AllDaysResponseBody]) -> Int {
    var count = 0
    for day in days{
        for _ in day.entries{
                count += 1
        }
    }
    return count
}

func getAverageMood(entries: [NewDayResponseBody.EntryResponse]) -> Double {
    var avgMood = 5.0
    
    for entry in entries{
        avgMood += entry.mood_score
    }
    return avgMood/(Double(entries.count) + 1.0)
}

func getDateObjectFromDbDateString(date: String, dayOfWeek: String, month: String) -> Date {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "dayOfWeek, month DD, yyyy at HH:mm ME"
//    let someDateTime = formatter.date(from: "\(dayOfWeek), \(month) \(date.suffix(2)), \(date.prefix(4)) at 10:55 PM")
//    return someDateTime!
    
    // Specify date components
    var dateComponents = DateComponents()
    dateComponents.year = Int(date.prefix(4))
    dateComponents.month = Int(date.suffix(4).prefix(2))
    dateComponents.day = Int(date.suffix(2))
    dateComponents.timeZone = TimeZone(abbreviation: "JST") // Japan Standard Time
    dateComponents.hour = 00
    dateComponents.minute = 00

    // Create date from components
    let userCalendar = Calendar(identifier: .gregorian) // since the components above (like year 1980) are for Gregorian
    let someDateTime = userCalendar.date(from: dateComponents)
    return someDateTime!
}

func getDaysFromSeconds(seconds: Double) -> Double {
    return -seconds/86400
}

func getNumDaysAgo(days: Double) -> String {
    var result = ""
    if days < 1 {
        result = "Today"
    }else if days < 2{
        result = "Yesterday"
    }else{
        result = "\(String(Int(round(days)))) Days Ago"
    }
    return result
}

func getAMPMTimeFromGMT(GMT: String) -> String {
    var AMPMTime = ""
    var AMOrPM = "AM"
    var hour = "0"
    
    if Int(GMT.prefix(2))! > 12{
        hour = String(Int(GMT.prefix(2))! - 12)
        AMOrPM = "PM"
        AMPMTime = "\(hour):\(GMT.prefix(5).suffix(2)) \(AMOrPM)"
    }else if Int(GMT.prefix(2)) == 0{
        AMPMTime = "12:\(GMT.prefix(5).suffix(2)) AM"
    }else{
        hour = String(Int(GMT.prefix(2))!)
        AMOrPM = "AM"
        AMPMTime = "\(hour):\(GMT.prefix(5).suffix(2)) \(AMOrPM)"
    }
    return AMPMTime
}

func getNumDaysWithEntries(days: [AllDaysResponseBody]) -> Int {
    var c = 0
    for day in days{
        if day.entries.count > 0{
            c += 1
        }
    }
    return c
}
