//
//  QuoteOfTheDayView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.
//

import SwiftUI

struct QuoteOfTheDay: View {
    var quoteAuthor: String
    var quote: String
    var body: some View {
        ZStack() {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("QUOTE OF THE DAY")
                        .bold().font(.title2).frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                        .frame(height: 2)
                    Text("\"\(quote)\"")
                    Text("- \(quoteAuthor)")
                        .italic().frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 200, alignment: .center)
        }
        .background(Color(.white.withAlphaComponent(0.8))).cornerRadius(20)
        .frame(maxWidth: 350)
        .offset(y: -50)
        Spacer()
        }
}

struct QuoteOfTheDay_Previews: PreviewProvider {
    static var previews: some View {
        QuoteOfTheDay(quoteAuthor: previewDay.quote_author, quote: previewDay.quote)
    }
}
