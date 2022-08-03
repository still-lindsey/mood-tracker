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
    @Binding var entryAdded: Bool
    @Binding var selectedTab: MenuTabs
    @ObservedObject var tabViewManager = TabViewManager()
    var body: some View {
        VStack{
//            if let day = day {
                    Button(action: {
                        Task {
                           try await self.entryManager.postNewEntry(dayId: dayId, moodScore: moodScore, selectedActivities: selectedActivities,
                        selectedFeelings: selectedFeelings,title: title,memo: memo)
                        }
                        Task {
                            try await self.getDayManager.getDay(dayId: dayId)
                        }
                        entryAdded = true
                        self.selectedTab = .first
                    }, label: {
                        Text("Add Entry")})
                    .padding(15)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    .foregroundColor(.white)
                     .background(
                         RoundedRectangle(cornerRadius: 25)
                            .fill(Color(hue: 1.0, saturation: 0.01, brightness: 0.79))
                     )
                     .buttonStyle(PlainButtonStyle())
        }

    }
}

struct SubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        SubmitButton(moodScore: 5.0, selectedActivities: ["work", "exercise"], selectedFeelings: ["stressed"], title: "Work", memo: "Was so busy today!", dayId: 2, entryAdded: .constant(true), selectedTab: .constant(.first))
    }
}
