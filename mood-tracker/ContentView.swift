//
//  ContentView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.

import SwiftUI

struct ContentView: View {
    var dayManager = DayManager()
    @State var day: NewDayResponseBody?
    @ObservedObject private var tabViewManager = TabViewManager()
    var body: some View {
        ZStack {
            if let day = day {
                let dayId: Int = day.day_id
                TabView(selection: $tabViewManager.currentTab) {
                    HomeView(day: day)
                        .environmentObject(tabViewManager)
                        .showTabBar(animated: false)
                        .tag(0)
                        .tabItem {
                            Image(systemName: "sun.max")
                        }

                    QuotesView()
                        .environmentObject(tabViewManager)
                        .showTabBar(animated: false)
                        .tag(1)
                        .tabItem {
                            Image(systemName: "quote.bubble")
                            
                        }

                    AddEntryView(dayId: dayId)
                        .environmentObject(tabViewManager)
                        .hideTabBar(animated: false)
                        .tag(2)
                        .tabItem {
                            Image(systemName: "plus")
                        }


                    AnalyticsView()
                        .environmentObject(tabViewManager)
                        .showTabBar(animated: false)
                        .tag(3)
                        .tabItem {
                            Image(systemName: "chart.xyaxis.line")
                        }
                    AllDaysView()
                        .environmentObject(tabViewManager)
                        .showTabBar(animated: false)
                        .tag(4)
                        .tabItem {
                            Image(systemName: "square.stack.3d.down.right")
                        }
                        
                }
                .hideTabBar(animated: false)
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
