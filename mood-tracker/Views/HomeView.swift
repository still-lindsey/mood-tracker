//
//  HomeView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

//struct HomeView: View {
//    var quote: String
//    var quoteAuthor: String
//    var date: String
//    var dayOfWeek: String
//    var month: String
//    struct EntriesList: Decodable {
//        var activities: [String]
//        var emotions: [String]
//        var entry_id: Int
//        var memo: String
//        var title: String
//        var mood_score: Double
//        var time_stamp: String
//    }
//
//    var body: some View {
//        VStack(spacing: 20) {
//            Date(date: date, dayOfWeek: dayOfWeek, month: month)
//            DayMood()
//            DailyCheckIn()
//            QuoteOfTheDay(quoteAuthor: quoteAuthor, quote: quote)
//            TabBar()
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color(red: 0.493, green: 0.921, blue: 0.795))
//        .preferredColorScheme(.light)
//        .frame(maxWidth: .infinity)
//    }
//}
//
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(quote: "Have a good day!", quoteAuthor: "Lindsey", date: "20220721", dayOfWeek: "Sunday", month: "July")
//    }
//}

struct HomeView: View {
    var dayManager = DayManager()
    @State var day: NewDayResponseBody?
    var body: some View {
        VStack(spacing: 20) {
            if let day = day {
                Date(date: day.date, dayOfWeek: day.day_of_week, month: day.month)
                DayMood()
                DailyCheckIn()
                QuoteOfTheDay(quoteAuthor: day.quote_author, quote: day.quote)
            }else{
                LoadingView()
                    .task {
                        do {
                            day = try await dayManager.postNewDay()
                        }catch {
                            print("Error getting today's data: \(error)")
                        }
                    }
            }
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
