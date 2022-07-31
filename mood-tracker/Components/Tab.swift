//
//  Tab.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TabItem(text: "Home", icon: "sun.max", tab: .home, color: .clear),
    TabItem(text: "Quotes", icon: "quote.bubble", tab: .quotes, color: .clear),
    TabItem(text: "Add Entry", icon: "plus", tab: .addEntry, color: .clear),
    TabItem(text: "Analytics", icon: "chart.xyaxis.line", tab: .analytics, color: .clear),
    TabItem(text: "All Days", icon: "square.stack.3d.down.right", tab: .allDays, color: .clear)
]

enum Tab: String {
    case home
    case quotes
    case addEntry
    case analytics
    case allDays
}
