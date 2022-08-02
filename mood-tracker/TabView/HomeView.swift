//
//  HomeView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

struct HomeView: View {
    var day: NewDayResponseBody
    struct DayData {
        var date: String
        var day_of_week: String
        var month: String
        var day_id: Int
        var entries: [EntryResponse]
        var quote: String
        var quote_author: String
        var status: String
    }
    struct EntryResponse{
        var activities: [String]
        var emotions: [String]
        var entry_id: Int
        var memo: String
        var title: String
        var mood_score: Double
        var time_stamp: String
    }
    var body: some View {
        VStack(spacing: 20) {
            Date(date: day.date, dayOfWeek: day.day_of_week, month: day.month)
            DayMood()
            DailyCheckIn()
            QuoteOfTheDay(quoteAuthor: day.quote_author, quote: day.quote)
            LoadingView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.493, green: 0.921, blue: 0.795))
        .preferredColorScheme(.light)
        .frame(maxWidth: .infinity)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(day: previewDay)
    }
}
