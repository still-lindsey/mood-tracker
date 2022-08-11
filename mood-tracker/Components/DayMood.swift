//
//  DayMood.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI
//need to download and use icon library depending on mood

struct DayMood: View {
    var avgMood: Double
    var body: some View {
        ZStack {
            VStack {
                Image(uiImage: getMoodDescriptionandIcon(moodScore:avgMood).1!)
                    .resizable()
                    .frame(width: 70.0, height: 70.0)
            }
        }
        .frame(minWidth: 75, maxHeight: 75, alignment: .center)
        .background(Color(hex: "7e7b8c"))
        .zIndex(5)
        .cornerRadius(10)
    }
}

struct DayMood_Previews: PreviewProvider {
    static var previews: some View {
        DayMood(avgMood: 5.0)
    }
}
