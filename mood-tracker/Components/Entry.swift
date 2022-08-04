//
//  Entry.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 8/4/22.
//

import SwiftUI

struct Entry: View {
    let moodScore: Double
    let title: String
    let memo: String
    let activities: [String]
    let feelings: [String]
    let timeStamp: String
    let entryId: Int
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Entry_Previews: PreviewProvider {
    static var previews: some View {
        Entry(moodScore: 9.0, title: "Hi", memo: "Hi", activities: ["hi"], feelings: ["running"], timeStamp: "Monday July 18", entryId: 9)
    }
}
