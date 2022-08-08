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
                ZStack () {
                    VStack{
                        RoundedRectangle(cornerRadius: 90, style: .continuous)
                            .foregroundStyle(.linearGradient(colors: [Color(hex: "FF9999")!, Color(hex:"FFCCB3")!], startPoint: .leading, endPoint: .trailing))
                            .frame(maxWidth: .infinity, minHeight: 400, maxHeight: 500, alignment: .leading)
                            .offset(y: -100)
                            .cornerRadius(90, corners: [.bottomLeft, .bottomRight])
                            .edgesIgnoringSafeArea(.top)
                        Spacer()
                    }
                    VStack{
                        VStack (spacing: 10){
                            Text("Today")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title)

                            Text("\(day.day_of_week), \(day.month) \(getDayOfMonth(date: day.date))")
                                .textCase(.uppercase)
                                .foregroundColor(Color(hex: "330000"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                        }
                        .padding()
                        .padding(.top)
                        .padding(.bottom)
                        .padding(.leading)
    
                        DayMood(avgMood: avgMood)
                        DailyCheckIn(selectedTab: $selectedTab)
                        Spacer(minLength: 40)
                        QuoteOfTheDay(quoteAuthor: day.quote_author, quote: day.quote)
                    }
                }
                .background(Color(hex: "EEEFFC"))
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
