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
        resultDes = "Really Terrible"
        resultIcon = UIImage(named: "crying")
    }else if moodScore >= 2 && moodScore < 4{
        resultDes = "Somewhat Bad"
        resultIcon = UIImage(named: "sad")
    }else if moodScore >= 4 && moodScore < 6 {
        resultDes = "Completely Okay"
        resultIcon = UIImage(named: "neutral")
    }else if moodScore >= 6 && moodScore < 8{
        resultDes = "Pretty Good"
        resultIcon = UIImage(named: "smile")
    }else{
        resultDes = "Super Awesome"
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
    if entries.count == 0{
        return 5.0
    }
    var avgMood: Double = 0
    for entry in entries{
        avgMood += entry.mood_score
    }
    return avgMood/Double(entries.count)
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

func getWeeksFromDays(days: Double) -> Int {
    var result = 0
    if days >= 7 {
        result = Int(floor(days/7))
    }
    return result
}

func getMonthsFromDays(days: Double) -> Int{
    var result = 0
    if days >= 30 {
        result = Int(floor(days/30))
    }
    return result
}

func getYearsFromDays(days: Double) -> Int {
    var result = 0
    if days >= 365 {
        result = Int(floor(days/365))
    }
    return result
}

func getTimeAgoConvertedString(timeAgo: Double) -> String {
    var result = ""
    var timeNum = 0
    var timeMarker = ""
    if timeAgo >= 7 && timeAgo < 30{
        timeNum = getWeeksFromDays(days: timeAgo)
        timeMarker = timeNum > 1 ? "Weeks Ago": "Week Ago"
        result = "\(timeNum) \(timeMarker)"
    }else if timeAgo >= 30 && timeAgo < 365{
        timeNum = getMonthsFromDays(days: timeAgo)
        timeMarker = timeNum > 1 ? "Months Ago": "Month Ago"
        result = "\(timeNum) \(timeMarker)"
    }else if timeAgo >= 365 {
        timeNum = getYearsFromDays(days: timeAgo)
        timeMarker = timeNum > 1 ? "Years Ago": "Year Ago"
        result = "\(timeNum) \(timeMarker)"
    }else{
        if timeAgo < 1{
            result = "Today"
        }else if timeAgo < 2 {
            result = "Yesterday"
        }else{
            timeMarker = "Days Ago"
            result = "\(Int(floor(timeAgo))) \(timeMarker)"
        }
    }
    return result
}

func getAMPMTimeFromGMT(GMT: String) -> String {

//    if GMT.prefix(1) == " "{
//        return "\(GMT.suffix(7))"
//    }else{
//        return "\(GMT.suffix(7))"
//    }
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

func getArrayOfWeeklyEntries(currentDayOfWeek: String, currentDate: String, allDays: [AllDaysResponseBody]) -> [Any]{
    var weekOfEntriesPerDay = [[], [], [], [], [], [], []] //M - S
    
    var daysCount = numChartedDays[currentDayOfWeek]
    var date: String = currentDate.copy() as! String
    while daysCount! > 0 {
        weekOfEntriesPerDay[daysCount! - 1] = findDaysEntries(allDays: allDays, targetDate: date)
        var currentYear = Int(date.prefix(4))
        var currentMonth = Int(date.suffix(4).prefix(2))
        var currentDay = Int(date.suffix(2))
        currentDay! -= 1
        if currentDay! < 1{
            currentMonth! -= 1
            currentDay = daysInMonth[currentMonth!]
        }
        if currentMonth! < 1 {
            currentYear! -= 1
            currentDay = 31
            currentMonth = 12
        }
        if currentDay! < 10 && currentMonth! < 10 {
            date = String("\(currentYear!)0\(currentMonth!)0\(currentDay!)")
        }else if currentDay! < 10{
            date = String("\(currentYear!)\(currentMonth!)0\(currentDay!)")
        }else if currentMonth! < 10 {
            date = String("\(currentYear!)0\(currentMonth!)\(currentDay!)")
        }else{
            date = String("\(currentYear!)\(currentMonth!)\(currentDay!)")
        }
        daysCount = daysCount! - 1
    }
    return weekOfEntriesPerDay
}

func findDaysEntries(allDays: [AllDaysResponseBody], targetDate: String) -> [Any] {
    var result: [Any] = []
    for day in allDays {
        if day.date == targetDate {
            result = day.entries
        }
    }
    return result
}

func getAverageMoodPerDay(weeklyEntries: [Any]) -> [Double]{
    var result = [5.0, 5.0, 5.0, 5.0, 5.0, 5.0, 5.0]
    
    var count = 7
    var avgMood = 0.0
    while count > 0 {
        if weeklyEntries.count != 0 {
            for entry in weeklyEntries {
                avgMood += (entry as! EntryResponse).mood_score
            }
            avgMood = avgMood / Double(weeklyEntries.count)
        }else{
            avgMood = 5.0
        }
        result[-count - 1] = avgMood
        count -= 1
    }
    print(result)
    return result
}

let daysInMonth = [1: 31, 2: 28, 3: 31, 4: 30, 5: 31, 6: 30, 7: 31, 8: 31, 9: 30, 10: 31, 11: 30, 12: 31]
let numChartedDays = ["Monday": 1, "Tuesday": 2, "Wednesday": 3, "Thursday": 4, "Friday": 5, "Saturday": 6, "Sunday": 7]
let daysCountDown = [1: "Monday", 2: "Tuesday", 3: "Wednesday", 4: "Thursday", 5: "Friday", 6: "Saturday", 7: "Sunday"]
let numMonthToName = ["01": "January", "02": "February", "03": "March", "04": "April", "05": "May", "06": "June", "07": "July", "08": "August", "09": "September", "10": "Octorber", "11": "November", "12": "December"]


func getLineChartData(daysAverageMood: [Double]) -> [Double]{
    var lineChartsData: [Double] = []
    for moodScore in daysAverageMood{
        if moodScore > 0{
            lineChartsData.append(moodScore)
        }
    }
    return lineChartsData
}

func getDaysAverageMoodsNotNull(data:[Double]) -> [Double] {
    var result_scores:[Double] = []
//    var result_indexes:[Int] = []
    var index = 0
    for score in data{
        if score >= 0{
            result_scores.append(score)
//            result_indexes.append(index)
        }
        index += 1
    }
    return result_scores
}

func getIndexesAverageMoodsNotNull(data:[Double]) -> [Int] {

    var result_indexes:[Int] = []
    var index = 0
    for score in data{
        if score >= 0{
            result_indexes.append(index)
        }
        index += 1
    }
    return result_indexes
}

func sortDaysById(days: [AllDaysResponseBody]) -> [AllDaysResponseBody] {
    let result = days.sorted {
        $0.day_id > $1.day_id
    }
    return result
}

