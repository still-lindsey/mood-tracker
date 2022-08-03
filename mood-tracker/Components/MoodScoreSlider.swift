//
//  MoodScoreSlider.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 8/1/22.
//

import SwiftUI

struct MoodScoreSlider: View {
    @Binding var moodScore: Double
    var body: some View {
        VStack {
            Slider(value: $moodScore, in: 0...10)
                .accentColor(Color.white)
                .padding()
            //just for checking state
//            Text("\(moodScore)")
//                .foregroundColor(.white)
        }
    }
}

struct MoodScoreSlider_Previews: PreviewProvider {
    static var previews: some View {
        MoodScoreSlider(moodScore: .constant(5.0))
    }
}
