//
//  ContentView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.

import SwiftUI

struct ContentView: View {
//    var dayManager = DayManager()
//    @State var day: NewDayResponseBody?
//    @ObservedObject var tabViewManager = TabViewManager()
    @State var entryAdded: Bool = false
    @State var change: Bool = false
    enum Tab: Int {
        case first, second, third, fourth, fifth
    }
    @State private var selectedTab = Tab.first
    var body: some View {
        VStack(spacing: 0) {
//            if let day = day {
//                let dayId = day.day_id
            
                ZStack {
                    ZStack {
                        if selectedTab == .first {
                            HomeView(entryAdded: $entryAdded)
                        }
                        else if selectedTab == .second {
                            NavigationView {
                                VStack(spacing: 0) {
                                    QuotesView(entryAdded: $entryAdded)
                                }
                            }
                        }
                        else if selectedTab == .third {
                            NavigationView {
                                VStack(spacing: 0) {
                                    AddEntryView(dayId: 6, change: $change, entryAdded: $entryAdded)
                                }
                            }
                        }else if selectedTab == .fourth {
                            NavigationView {
                                VStack(spacing: 0) {
                                    AnalyticsView(entryAdded: $entryAdded)
                                }
                            }
                        }else if selectedTab == .fifth {
                            NavigationView {
                                VStack(spacing: 0) {
                                    AllDaysView(entryAdded: $entryAdded)
                                }
                            }
                        }
                    }
                }
                    tabBarView

//            }else{
//                LoadingView()
//                    .task {
//                        do {
//                            day = try await dayManager.postNewDay()
//                        }catch {
//                            print("Error getting today's data: \(error)")
//                    }
//                }
//            }
        }
    }
    
    var tabBarView: some View {
        ZStack() {
            Divider()
            
            HStack(spacing: 20) {
                tabBarItem(.first, title: "Home", icon: "sun.max", selectedIcon: "sun.max")
                tabBarItem(.second, title: "Quotes", icon: "quote.bubble", selectedIcon: "quote.bubble")
                tabBarItem(.third, title: "Add Entry", icon: "plus", selectedIcon: "plus")
                tabBarItem(.fourth, title: "Analytics", icon: "chart.xyaxis.line", selectedIcon: "chart.xyaxis.line")
                tabBarItem(.fifth, title: "All Entries", icon: "square.stack.3d.down.right", selectedIcon: "square.stack.3d.down.right")
            }
            .padding(.top, 8)
        }
        .zIndex(entryAdded == false ? 0 : 2)
        .frame(height: 50)
        .background(selectedTab == .third && !entryAdded ? Color(red: 0.493, green: 0.921, blue: 0.795).edgesIgnoringSafeArea(.all) : Color.white.edgesIgnoringSafeArea(.all))
    }
    
    func tabBarItem(_ tab: Tab, title: String, icon: String, selectedIcon: String) -> some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 3) {
                VStack {
                    Image(systemName: (selectedTab == tab ? selectedIcon : icon))
                        .font(.system(size: 24))
                        .foregroundColor(selectedTab == .third && !entryAdded ? Color(red: 0.493, green: 0.921, blue: 0.795) : .black)
                }
                .frame(width: 55, height: 28)
                
                Text(title)
                    .font(.system(size: 11))
//                    .foregroundColor(selectedTab == tab ? .primary : .black)
                    .foregroundColor(selectedTab == .third && !entryAdded ? Color(red: 0.493, green: 0.921, blue: 0.795) : .black)
                
            }
        }
        .frame(width: 65, height: 42)
        .onTapGesture {
            selectedTab = tab
        }
        
        
        
        
//        ZStack {
//            if let day = day {
//                let dayId: Int = day.day_id
//                TabView(selection: $tabViewManager.currentTab) {
//                    HomeView(day: day)
//                        .environmentObject(tabViewManager)
//                        .showTabBar(animated: false)
//                        .tag(0)
//                        .tabItem {
//                            Image(systemName: "sun.max")
//                        }
//
//                    QuotesView()
//                        .environmentObject(tabViewManager)
//                        .showTabBar(animated: false)
//                        .tag(1)
//                        .tabItem {
//                            Image(systemName: "quote.bubble")
//
//                        }
//
//                    AddEntryView(dayId: dayId, change: $change)
//                        .environmentObject(tabViewManager)
//                        .hideTabBar(animated: false)
//                        .tag(2)
//                        .tabItem {
//                            Image(systemName: "plus")
//                        }
//
//
//                    AnalyticsView()
//                        .environmentObject(tabViewManager)
//                        .showTabBar(animated: false)
//                        .tag(3)
//                        .tabItem {
//                            Image(systemName: "chart.xyaxis.line")
//                        }
//                    AllDaysView()
//                        .environmentObject(tabViewManager)
//                        .showTabBar(animated: false)
//                        .tag(4)
//                        .tabItem {
//                            Image(systemName: "square.stack.3d.down.right")
//                        }
//
//                }
//                .hideTabBar(animated: false)
//            }else{
//                LoadingView()
//                    .task {
//                        do {
//                            day = try await dayManager.postNewDay()
//                        }catch {
//                            print("Error getting today's data: \(error)")
//                    }
//                }
//            }
//        }
//        .zIndex(0)
        //trying to fix nav view from add entry
//        if change {
//            VStack {
//                AddEntryView(dayId: dayId, change: $change)
//            }
//            .zIndex(1)
//            .background(Color(red: 0.493, green: 0.921, blue: 0.795))
//            .transition(AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
