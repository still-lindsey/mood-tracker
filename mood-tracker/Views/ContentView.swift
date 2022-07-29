//
//  ContentView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.
//

import SwiftUI

struct ContentView: View {
    var dayManager = DayManager()
    @State var day: ResponseBody?
    var body: some View {
        VStack(spacing: 20) {
            if let day = day {
                DailyCheckIn()
                QuoteOfTheDay(day: day)
            }else {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
