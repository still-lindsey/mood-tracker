//
//  QuoteOfTheDayView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.
//

import SwiftUI

struct QuoteOfTheDay: View {
    var day: ResponseBody
    var body: some View {
        VStack() {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("QUOTE OF THE DAY")
                        .bold().font(.title2).frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                        .frame(height: 2)
                    Text("\"\(day.quote)\"")
                    Text("- \(day.quote_author)")
                        .italic().frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 175, alignment: .center)
        }
        .background(Color(.white.withAlphaComponent(0.8))).cornerRadius(20)
        .frame(maxWidth: 350)
        Spacer()
        }
}

struct QuoteOfTheDay_Previews: PreviewProvider {
    static var previews: some View {
        QuoteOfTheDay(day: previewDay)
    }
}
