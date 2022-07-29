//
//  DailyCheckIn.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.
//

import SwiftUI

struct DailyCheckIn: View {
    var body: some View {
        VStack() {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Daily Check-in")
                        .bold().font(.title).frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                        .frame(height: 2)
                    Text("How are you feeling today?")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 175, alignment: .center)
        }
        .background(Color(.white.withAlphaComponent(0.8))).cornerRadius(20)
        .frame(maxWidth: 350)
        }
}

struct DailyCheckIn_Previews: PreviewProvider {
    static var previews: some View {
        DailyCheckIn()
    }
}
