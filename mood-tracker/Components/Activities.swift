//
//  Activities.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

struct ActivityItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
}

var ActivityItems = [
    ActivityItem(text: "work", icon: "briefcase"),
    ActivityItem(text: "family", icon: "house"),
    ActivityItem(text: "friends", icon: "person"),
    ActivityItem(text: "hobbies", icon: "medal"),
    ActivityItem(text: "gaming", icon: "gamecontroller"),
    ActivityItem(text: "weather", icon: "cloud.sun"),
    ActivityItem(text: "school", icon: "graduationcap"),
    ActivityItem(text: "relationship", icon: "heart"),
    ActivityItem(text: "traveling", icon: "sailboat"),
    ActivityItem(text: "sleep", icon: "bed.double"),
    ActivityItem(text: "shopping", icon: "bag"),
    ActivityItem(text: "food", icon: "carrot"),
    ActivityItem(text: "exercise", icon: "dumbbell"),
    ActivityItem(text: "health", icon: "cross.case"),
    ActivityItem(text: "music", icon: "beats.headphones"),
    ActivityItem(text: "relaxing", icon: "sofa"),
    ActivityItem(text: "holiday", icon: "beach.umbrella"),
    ActivityItem(text: "party", icon: "party.popper"),
    ActivityItem(text: "mindfulness", icon: "brain.head.profile"),
    ActivityItem(text: "art", icon: "photo.artframe")
]

