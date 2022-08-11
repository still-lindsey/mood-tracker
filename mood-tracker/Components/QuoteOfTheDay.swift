//
//  QuoteOfTheDayView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.
//

import SwiftUI

struct QuoteOfTheDay: View {
    @Binding var selectedTab: MenuTabs
    var quoteAuthor: String
    var quote: String
    var body: some View {
        ZStack() {
            VStack(alignment: .leading, spacing: 5) {
                Text("QUOTE OF THE DAY")
                    .bold().font(.system(.title2, design: .rounded)).frame(maxWidth: .infinity, alignment: .center)
                    
                Spacer()
                    .frame(height: 2)
                Text("\"\(quote)\"")
                    .font(.system(.body, design: .rounded))
                    .bold()
                Text("- \(quoteAuthor)")
                    .font(.system(.body, design: .rounded))
                    .bold().italic().frame(maxWidth: .infinity, alignment: .trailing)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(.white)
            .padding(.horizontal)
            .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, minHeight: 200, alignment: .center)
        .background(Image("cherryBlossoms").overlay(Color(hex: "7f7a99").opacity(0.6)))
        .cornerRadius(20)
        .shadow(color: .black, radius: 10, x: 5, y: 5)
        .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
        .padding(.horizontal)
        .offset(y: -50)
        .zIndex(1)
        .onTapGesture {
            selectedTab = .second
        }
        Spacer()
        }
}

struct QuoteOfTheDay_Previews: PreviewProvider {
    static var previews: some View {
        QuoteOfTheDay(selectedTab: .constant(.first), quoteAuthor: previewDay.quote_author, quote: previewDay.quote)
    }
}
