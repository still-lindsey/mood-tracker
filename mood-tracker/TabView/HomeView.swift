//
//  HomeView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

struct HomeView: View {
    var dayManager = DayManager()
    @Binding var selectedTab: MenuTabs
    @State var day: NewDayResponseBody?
    @Binding var entryAdded: Bool
    var body: some View {
            if let day = day {
                let avgMood = getAverageMood(entries: day.entries)
                VStack(spacing: 20) {
                    ZStack () {
                        VStack (spacing: 20){
                            Text("Today")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title)
                            Text("\(day.day_of_week), \(day.month) \(getDayOfMonth(date: day.date))")
                                .textCase(.uppercase)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                        }
                        .padding()
                        .padding(.top)
                        .padding(.bottom)
                        .padding(.leading)
                    }
                    .background(Color(hue: 0.471, saturation: 0.948, brightness: 0.563))
                    .cornerRadius(90, corners: [.bottomLeft, .bottomRight])
                    .edgesIgnoringSafeArea(.top)
                    DayMood(avgMood: avgMood)
                    DailyCheckIn(selectedTab: $selectedTab)
                    QuoteOfTheDay(quoteAuthor: day.quote_author, quote: day.quote)
                }
                .background(Color(red: 0.493, green: 0.921, blue: 0.795))
                .preferredColorScheme(.light)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .onAppear{
                    entryAdded = false
                }
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
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedTab: .constant(.first), day: previewDay, entryAdded: .constant(true))
    }
}
