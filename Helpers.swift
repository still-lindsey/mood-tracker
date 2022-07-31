//
//  Helpers.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import Foundation


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
