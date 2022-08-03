//
//  ContentView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.

import SwiftUI

struct ContentView: View {
    @State var entryAdded: Bool = false
    @State var change: Bool = false
    enum Tab: Int {
        case first, second, third, fourth, fifth
    }
    @State private var selectedTab = Tab.first
    var body: some View {
        VStack(spacing: 0) {
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
                                AddEntryView(change: $change, entryAdded: $entryAdded)
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
        .padding(.leading)
        .padding(.trailing)
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
                    .foregroundColor(selectedTab == .third && !entryAdded ? Color(red: 0.493, green: 0.921, blue: 0.795) : .black)
                
            }
        }
        .frame(width: 62, height: 42)
        .onTapGesture {
            selectedTab = tab
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
