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
        .background(Image("cherryBlossoms").overlay(Color.white.opacity(0.7))).cornerRadius(20)
        .frame(maxWidth: 350)
        .shadow(color: .black, radius: 10, x: 5, y: 5)
        .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
        .offset(y: -50)
        Spacer()
        
//        VStack{
//            Text("QUOTE OF THE DAY")
//                .bold().font(.title2).frame(maxWidth: .infinity, alignment: .center)
//            Spacer()
//                .frame(height: 2)
//            Text("\"\(quote)\"")
//                .padding(.leading).padding(.trailing).padding(.top)
//            Text("- \(quoteAuthor)")
//                .italic().frame(maxWidth: .infinity, alignment: .trailing)
//                .padding(.trailing)
//        }
//            .frame(maxWidth: .infinity, minHeight: 200, alignment: .center)
//            .background(Color(.white)).cornerRadius(20)
//            .frame(maxWidth: 350)
//            .shadow(color: .black, radius: 10, x: 5, y: 5)
//
//            .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
        }
}

struct QuoteOfTheDay_Previews: PreviewProvider {
    static var previews: some View {
        QuoteOfTheDay(quoteAuthor: previewDay.quote_author, quote: previewDay.quote)
    }
}
