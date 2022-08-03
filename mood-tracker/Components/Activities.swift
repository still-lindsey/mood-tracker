//
//  Activities.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

struct ActivityItem: Identifiable, Equatable {
    static func == (lhs: ActivityItem, rhs: ActivityItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var text: String
    var icon: String
    @State var isSelected: Bool
}

var activityItems = [
    ActivityItem(text: "work", icon: "briefcase", isSelected: false),
    ActivityItem(text: "family", icon: "house", isSelected: false),
    ActivityItem(text: "friends", icon: "person", isSelected: false),
    ActivityItem(text: "hobbies", icon: "star", isSelected: false),
    ActivityItem(text: "gaming", icon: "gamecontroller", isSelected: false),
    ActivityItem(text: "weather", icon: "cloud.sun", isSelected: false),
    ActivityItem(text: "school", icon: "graduationcap", isSelected: false),
    ActivityItem(text: "relationship", icon: "heart", isSelected: false),
    ActivityItem(text: "traveling", icon: "airplane", isSelected: false),
    ActivityItem(text: "sleep", icon: "zzz", isSelected: false),
    ActivityItem(text: "shopping", icon: "bag", isSelected: false),
    ActivityItem(text: "food", icon: "fork.knife", isSelected: false),
    ActivityItem(text: "exercise", icon: "bolt.heart", isSelected: false),
    ActivityItem(text: "health", icon: "cross.case", isSelected: false),
    ActivityItem(text: "music", icon: "beats.headphones", isSelected: false),
    ActivityItem(text: "relaxing", icon: "bed.double", isSelected: false),
    ActivityItem(text: "mindfulness", icon: "brain.head.profile", isSelected: false),
    ActivityItem(text: "art", icon: "photo.artframe", isSelected: false)
]


