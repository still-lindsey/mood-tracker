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
    @State var entryAdded: Bool = false
    @State var selectedTab = MenuTabs.first
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                ZStack {
                    if selectedTab == .first {
                        HomeView(entryAdded: $entryAdded)
                    }
                    else if selectedTab == .second {
                        
                            VStack(spacing: 0) {
                                QuotesView(entryAdded: $entryAdded)
                            }
                        
                    }
                    else if selectedTab == .third {
                  
                            VStack(spacing: 0) {
                                AddEntryView(entryAdded: $entryAdded, selectedTab: $selectedTab)
                            }
                        
                    }else if selectedTab == .fourth {
                      
                            VStack(spacing: 0) {
                                AnalyticsView(entryAdded: $entryAdded)
                       
                        }
                    }else if selectedTab == .fifth {

                            VStack(spacing: 0) {
                                AllDaysView(entryAdded: $entryAdded)
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
                        .foregroundColor(.black)
                }
                .frame(width: 55, height: 28)
                
                Text(title)
                    .font(.system(size: 11))
                    .foregroundColor(.black)
                
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
