//
//  Feelings.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 8/2/22.
//

import SwiftUI

struct FeelingItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: UIImage?
    var emoji: String
}

var feelingItems = [
    FeelingItem(text: "happy", icon: UIImage(named: "happy"), emoji: "😄"),
    FeelingItem(text: "sad", icon: UIImage(named: "sad"), emoji: "😔"),
    FeelingItem(text: "angry", icon: UIImage(named: "angry"), emoji: "😠"),
    FeelingItem(text: "shocked", icon: UIImage(named: "shocked"), emoji: "😮"),
    FeelingItem(text: "fear", icon: UIImage(named: "crying"), emoji: "😧"),
    FeelingItem(text: "excited", icon: UIImage(named: "embarrassed"), emoji: "😆"),
    FeelingItem(text: "disgusted", icon: UIImage(named: "digust"), emoji: "🤮"),
    FeelingItem(text: "worried", icon: UIImage(named: "anxious"), emoji: "😟"),
    FeelingItem(text: "embarrassed", icon: UIImage(named: "embarrassed"), emoji: "😳"),
    FeelingItem(text: "annoyed", icon: UIImage(named: "embarrassed"), emoji: "😒")
]
