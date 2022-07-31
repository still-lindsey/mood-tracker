//
//  DayMood.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI
//need to download and use icon library depending on mood
struct DayMood: View {
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "face.smiling")
                    .font(.largeTitle)
            }
        }
        .frame(minWidth: 75, maxHeight: 75, alignment: .center)
        .background(Color(.white))
        .zIndex(5)
        .cornerRadius(10)
    }
}

struct DayMood_Previews: PreviewProvider {
    static var previews: some View {
        DayMood()
    }
}
