//
//  DailyCheckIn.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.
//

import SwiftUI

struct DailyCheckIn: View {
    @Binding var selectedTab: MenuTabs
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("DAILY CHECK-IN")
                    .bold().font(.system(.title2, design: .rounded)).frame(maxWidth: .infinity, alignment: .center)
                Spacer()
                    .frame(height: 2)
                Text("How are you feeling today?")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(.body, design: .rounded))
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
        }
        .frame(maxWidth: .infinity, minHeight: 200, alignment: .center)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black, radius: 10, x: 5, y: 5)
        .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
        .padding(.horizontal)
        .offset(y: -50)
        .zIndex(2)
        .onTapGesture {
            selectedTab = .third
        }
    }
}


struct DailyCheckIn_Previews: PreviewProvider {
    static var previews: some View {
        DailyCheckIn(selectedTab: .constant(.first))
    }
}
