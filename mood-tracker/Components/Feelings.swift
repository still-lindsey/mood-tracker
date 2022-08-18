//
//  Feelings.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 8/2/22.
//

import SwiftUI

struct FeelingItem: Identifiable, Equatable {
    static func == (lhs: FeelingItem, rhs: FeelingItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var text: String
    var icon: UIImage?
    var emoji: String
    @State var isSelected: Bool
}

var feelingItems = [
    FeelingItem(text: "happy", icon: UIImage(named: "1"), emoji: "😄", isSelected: false),
    FeelingItem(text: "sad", icon: UIImage(named: "5"), emoji: "😔", isSelected: false),
    FeelingItem(text: "angry", icon: UIImage(named: "8"), emoji: "😠", isSelected: false),
    FeelingItem(text: "shocked", icon: UIImage(named: "34"), emoji: "😮", isSelected: false),
    FeelingItem(text: "bored", icon: UIImage(named: "23"), emoji: "😐", isSelected: false),
    FeelingItem(text: "confused", icon: UIImage(named: "10"), emoji: "😣", isSelected: false),
    FeelingItem(text: "scared", icon: UIImage(named: "31"), emoji: "😧", isSelected: false),
    FeelingItem(text: "drained", icon: UIImage(named: "27"), emoji: "😓", isSelected: false),
    FeelingItem(text: "excited", icon: UIImage(named: "16"), emoji: "😆", isSelected: false),
    FeelingItem(text: "disgusted", icon: UIImage(named: "2"), emoji: "🤮", isSelected: false),
    FeelingItem(text: "loved", icon: UIImage(named: "7"), emoji: "🥰", isSelected: false),
    FeelingItem(text: "worried", icon: UIImage(named: "33"), emoji: "😟", isSelected: false),
    FeelingItem(text: "ashamed", icon: UIImage(named: "30"), emoji: "😳", isSelected: false),
    FeelingItem(text: "suspicious", icon: UIImage(named: "32"), emoji: "🤨", isSelected: false),
    FeelingItem(text: "irritated", icon: UIImage(named: "36"), emoji: "😒", isSelected: false)
]

var feelingIconDict = [
    "happy": "1-1",
    "sad": "5-1",
    "angry": "8-1",
    "shocked": "34-1",
    "bored": "23-1",
    "confused": "10-1",
    "scared": "31-1",
    "drained": "27-1",
    "excited": "16-1",
    "disgusted": "2-1",
    "loved": "7-1",
    "worried": "33-1",
    "ashamed": "30-1",
    "suspicious": "32-1",
    "irritated": "36-1" 
]

class Feeling {
    var id: UUID
    var text: String
    var icon: UIImage?
    var emoji: String
    var isSelected: Bool

    init(text: String, icon: UIImage, emoji: String) {
        self.id = UUID()
        self.text = text
        self.icon = icon
        self.emoji = emoji
        self.isSelected = false
    }
    
    func select() -> Bool {
        self.isSelected = !self.isSelected
        return self.isSelected
    }
    
}

