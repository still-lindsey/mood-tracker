//
//  ContentView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.
//FIX CONDITIONAL STYLES
import SwiftUI
enum MenuTabs: Int {
    case first, second, third, fourth, fifth
}

struct ContentView: View {
    var dayManager = DayManager()
    @State var day: NewDayResponseBody = previewDay
    @State var selectedTab = MenuTabs.first
    var body: some View {
            VStack(spacing: 0) {
                ZStack {
                    ZStack {
                        if selectedTab == .first {
                            HomeView(day: $day, selectedTab: $selectedTab)
                                .transition(.scale)
                        }
                        else if selectedTab == .second {
                            
                                VStack(spacing: 0) {
                                    QuotesView(day: day)
                                        .transition(.scale)
                                }
                            
                        }
                        else if selectedTab == .third {
                      
                                VStack(spacing: 0) {
                                    AddEntryView(day: day, selectedTab: $selectedTab)
                                        .transition(.scale)
                                }
                            
                        }else if selectedTab == .fourth {
                          
                                VStack(spacing: 0) {
                                    AnalyticsView(today: day)
                                        .transition(.scale)
                           
                            }
                        }else if selectedTab == .fifth {

                                VStack(spacing: 0) {
                                    AllDaysView()
                                        .transition(.scale)
                            }
                        }
                    }
                }
                if selectedTab != .third {
                    tabBarView
                }
            }
    }
    
    var tabBarView: some View {
        ZStack() {
            Divider()
            
            HStack(spacing: 20) {
                tabBarItem(.first, title: " ", icon: "sun.max", selectedIcon: "sun.max")
                tabBarItem(.second, title: " ", icon: "quote.bubble", selectedIcon: "quote.bubble")
                tabBarItem(.third, title: " ", icon: "plus", selectedIcon: "plus")
                tabBarItem(.fourth, title: " ", icon: "chart.xyaxis.line", selectedIcon: "chart.xyaxis.line")
                tabBarItem(.fifth, title: " ", icon: "square.stack.3d.down.right", selectedIcon: "square.stack.3d.down.right")
            }
            .padding(.top, 8)
        }
        .frame(height: 50)
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .padding(.leading)
        .padding(.trailing)
    }
    
    func tabBarItem(_ tab: MenuTabs, title: String, icon: String, selectedIcon: String) -> some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 3) {
                VStack {
                    Image(systemName: (selectedTab == tab ? selectedIcon : icon))
                        .font(.system(size: 24))
                        .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                }
                .frame(width: 55, height: 28)
                
                Text(title)
                    .font(.system(size: 11, design: .rounded))
                    .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                
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
            ContentView(day: previewDay)
        }
    }
}
