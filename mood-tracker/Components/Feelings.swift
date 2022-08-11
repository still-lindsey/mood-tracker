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
    FeelingItem(text: "happy", icon: UIImage(named: "happy"), emoji: "😄", isSelected: false),
    FeelingItem(text: "sad", icon: UIImage(named: "sad"), emoji: "😔", isSelected: false),
    FeelingItem(text: "angry", icon: UIImage(named: "angry"), emoji: "😠", isSelected: false),
    FeelingItem(text: "shocked", icon: UIImage(named: "shocked"), emoji: "😮", isSelected: false),
    FeelingItem(text: "bored", icon: UIImage(named: "shocked"), emoji: "😐", isSelected: false),
    FeelingItem(text: "confused", icon: UIImage(named: "shocked"), emoji: "😣", isSelected: false),
    FeelingItem(text: "scared", icon: UIImage(named: "crying"), emoji: "😧", isSelected: false),
    FeelingItem(text: "drained", icon: UIImage(named: "crying"), emoji: "😓", isSelected: false),
    FeelingItem(text: "excited", icon: UIImage(named: "embarrassed"), emoji: "😆", isSelected: false),
    FeelingItem(text: "disgusted", icon: UIImage(named: "digust"), emoji: "🤮", isSelected: false),
    FeelingItem(text: "loved", icon: UIImage(named: "digust"), emoji: "🥰", isSelected: false),
    FeelingItem(text: "worried", icon: UIImage(named: "anxious"), emoji: "😟", isSelected: false),
    FeelingItem(text: "embarrassed", icon: UIImage(named: "embarrassed"), emoji: "😳", isSelected: false),
    FeelingItem(text: "suspicious", icon: UIImage(named: "embarrassed"), emoji: "🤨", isSelected: false),
    FeelingItem(text: "irritated", icon: UIImage(named: "embarrassed"), emoji: "😒", isSelected: false)
]

var feelingIconDict = [
    "happy": "😄",
    "sad": "😔",
    "angry": "😠",
    "shocked": "😮",
    "bored": "😐",
    "confused": "😣",
    "scared": "😧",
    "drained": "😓",
    "excited": "😆",
    "disgusted": "🤮",
    "loved": "🥰",
    "worried": "😟",
    "embarrassed": "😳",
    "suspicious": "🤨",
    "irritated": "😒"
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

