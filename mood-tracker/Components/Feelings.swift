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

//var happy = Feeling(text: "happy", icon: UIImage(named: "happy")!, emoji: "😄")
//var sad = Feeling(text: "sad", icon: UIImage(named: "sad")!, emoji: "😔")
//var angry = Feeling(text: "angry", icon: UIImage(named: "angry")!, emoji: "😠")
//var shocked = Feeling(text: "shocked", icon: UIImage(named: "shocked")!, emoji: "😮")
//var scared = Feeling(text: "scared", icon: UIImage(named: "crying")!, emoji: "😧")
//var excited =  Feeling(text: "excited", icon: UIImage(named: "embarrassed")!, emoji: "😆")
//var disgusted = Feeling(text: "disgusted", icon: UIImage(named: "digust")!, emoji: "🤮")
//var worried = Feeling(text: "worried", icon: UIImage(named: "anxious")!, emoji: "😟")
//var embarrassed = Feeling(text: "embarrassed", icon: UIImage(named: "embarrassed")!, emoji: "😳")
//var annoyed = Feeling(text: "annoyed", icon: UIImage(named: "embarrassed")!, emoji: "😒")
//
//var feelingList = [happy, sad, angry, shocked, scared, excited, disgusted, worried, embarrassed, annoyed]
 
//func createFeelingsInstanceList() -> [Feeling]{
//    var result: [Feeling] = []
//    
//    var count: Int = 0
//    for _ in [...10] {
//        let instance = Feeling(text: feelingItems[count].text, icon: feelingItems[count].icon!, emoji: feelingItems[count].emoji)
//        count += 1
//        result.append(instance)
//    }
//    return result
//}
