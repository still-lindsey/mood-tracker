//
//  QuotesView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

struct QuotesView: View {
    var dayManager = DayManager()
    @State var day: NewDayResponseBody?
    var randomQuoteManager = GetRandomQuoteManager()
    @State var randomQuote: GetRandomQuoteResponseBody?
    @State var displayedQuote: String = ""
    @State var displayedAuthor: String = ""
    @Binding var entryAdded: Bool
    var body: some View {
        if let day = day {
            VStack{
                VStack(alignment: .center){
                    Text("\(self.displayedQuote)")
                        .font(.system(size: 30, design: .rounded))
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                        .opacity(0.9)
                    Text("— \(self.displayedAuthor) —")
                        .bold().font(.system(.body, design: .rounded))
                        .textCase(.uppercase)
                        .opacity(0.7)
                }
                .padding()
                .multilineTextAlignment(.center)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .foregroundColor(.white)
            .background(Image("mountain").resizable()
                .scaledToFill().overlay(Color(hex: "1C232E").opacity(0.4)).edgesIgnoringSafeArea(.all))
            .onAppear{
                self.displayedQuote = day.quote
                self.displayedAuthor = day.quote_author
            }
            .onTapGesture {
                
                Task{
                    do{
                        self.randomQuote = try await randomQuoteManager.getRandomQuote()
                        withAnimation(.easeOut(duration: 1)){
                        self.displayedQuote = self.randomQuote!.q
                        self.displayedAuthor = self.randomQuote!.a
                        }
                    }catch{
                        print("Error getting random quote: \(error)")
                    }
                }
            }
    }else {
        LoadingView()
            .task {
                do {
                    day = try await dayManager.postNewDay()
                }catch {
                    print("Error getting today's data: \(error)")
            }
        }
    }
    }
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesView(entryAdded: .constant(true))
    }
}
