//
//  HomeView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

struct HomeView: View {
    @State var scale = 1.0
    var dayManager = DayManager()
    @Binding var day: NewDayResponseBody
    @Binding var selectedTab: MenuTabs
        var body: some View {
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
                        if day.date != "20220731"{
                        ScrollView{
                            VStack{
                                VStack (spacing: 10){
                                    Text("Today")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(.title, design: .rounded))

                                    Text("\(day.day_of_week), \(day.month) \(getDayOfMonth(date: day.date))")
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(.body, design: .rounded))
                                        .textCase(.uppercase)
                                        .foregroundColor(Color(hex: "383D47")?.opacity(0.4))
                                        
                                    Spacer()
                                }
                                .padding()
                                .padding(.top)
                                .padding(.bottom)
                                .padding(.leading)
                                DayMood(avgMood: avgMood)
                                DailyCheckIn(selectedTab: $selectedTab)
                                Spacer(minLength: 40)
                                QuoteOfTheDay(selectedTab: $selectedTab, quoteAuthor: day.quote_author, quote: day.quote)
                            }
                        }
                        }
                    }
                    .onAppear{
                        Task {
                            do {
                                let result = try await dayManager.postNewDay()
                                withAnimation(.easeIn(duration: 1)){
                                    day = result
                                }
                            }catch {
                                print("Error getting today's data: \(error)")
                        }
                        }}
                    .background(Color(hex: "EEEFFC"))
                    .preferredColorScheme(.light)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(day: .constant(previewDay), selectedTab: .constant(.first))
    }
}
