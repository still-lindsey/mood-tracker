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

        ZStack() {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("DAILY CHECK-IN")
                        .bold().font(.title2).frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                        .frame(height: 2)
                    Text("How are you feeling today?")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .frame(maxWidth: .infinity, alignment: .center)

            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 200, alignment: .center)

        }
        .background(.white).cornerRadius(20)
        .zIndex(1)
        .foregroundColor(.black)
        .frame(maxWidth: 350)
        .shadow(color: .black, radius: 10, x: 5, y: 5)
        .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
        .offset(y: -50)
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
