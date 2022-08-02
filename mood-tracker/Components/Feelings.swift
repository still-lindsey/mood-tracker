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
    FeelingItem(text: "scared", icon: UIImage(named: "crying"), emoji: "😧", isSelected: false),
    FeelingItem(text: "excited", icon: UIImage(named: "embarrassed"), emoji: "😆", isSelected: false),
    FeelingItem(text: "disgusted", icon: UIImage(named: "digust"), emoji: "🤮", isSelected: false),
    FeelingItem(text: "worried", icon: UIImage(named: "anxious"), emoji: "😟", isSelected: false),
    FeelingItem(text: "embarrassed", icon: UIImage(named: "embarrassed"), emoji: "😳", isSelected: false),
    FeelingItem(text: "annoyed", icon: UIImage(named: "embarrassed"), emoji: "😒", isSelected: false)
]
