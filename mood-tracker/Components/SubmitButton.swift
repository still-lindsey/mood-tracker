//
//  SubmitButton.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 8/2/22.
//

import SwiftUI

struct SubmitButton: View {
    var entryManager = EntryManager()
    var getDayManager = GetDayManager()
    var moodScore: Double
    var selectedActivities: [String]
    var selectedFeelings: [String]
    var title: String
    var memo: String
    var dayId: Int
    @Binding var selectedTab: MenuTabs
    @ObservedObject var tabViewManager = TabViewManager()
    var body: some View {

            Button(action: {
                Task {
                   try await self.entryManager.postNewEntry(dayId: dayId, moodScore: moodScore, selectedActivities: selectedActivities,
                selectedFeelings: selectedFeelings,title: title,memo: memo)
                }
                Task {
                    try await self.getDayManager.getDay(dayId: dayId)
                }
                self.selectedTab = .first
            }, label: {
                Text("Add Entry")})
            .padding(15)
            .padding(.leading, 50)
            .padding(.trailing, 50)
            .foregroundStyle(.linearGradient(colors: [Color(hex: "FF9999")!, Color(hex:"FFCCB3")!], startPoint: .leading, endPoint: .trailing))
             .background(
                 RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
             )
             .buttonStyle(PlainButtonStyle())

    }
}

struct SubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        SubmitButton(moodScore: 5.0, selectedActivities: ["work", "exercise"], selectedFeelings: ["stressed"], title: "Work", memo: "Was so busy today!", dayId: 2, selectedTab: .constant(.first))
    }
}
