//
//  AddEntryView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

struct AddEntryView: View {
//    @State var moodScore: Double
//    @State var activities: [String]
//    @State var emotions: [String]
//    @State var title: String
//    @State var memo: String
    var body: some View {
        VStack{
            Text("Hey Lindsey, how are you feeling today?")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.493, green: 0.921, blue: 0.795))
        .preferredColorScheme(.light)
        .frame(maxWidth: .infinity)
    }
}

struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView()
//        AddEntryView(moodScore: 7.0, activities: ["hobbies", "family"], emotions: ["happy", "relaxed"], title: "Good day", memo: "Went to Boulder to go hiking with my brothers.")
    }
}
