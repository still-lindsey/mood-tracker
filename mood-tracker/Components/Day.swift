//
//  Day.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 8/4/22.
//

import SwiftUI

struct Day: View {
    let entries: [AllDaysResponseBody.EntryResponse]
    let month: String
    let id: Int
    let date: String
    let dayOfWeek: String
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Text("06")
                    Text(month)
                }
                VStack{
                    Text(dayOfWeek)
                    Text("2 DAYS AGO")
                }
            }
            ForEach(entries, id: \.self){entry in
                Entry(moodScore: entry.mood_score, title: entry.title, memo: entry.memo, activities: entry.activities, feelings: entry.emotions, timeStamp: entry.time_stamp, entryId: entry.entry_id)
            }

        }
    }
}

struct Day_Previews: PreviewProvider {
    static var previews: some View {
        Day(entries: previewEntries, month: "July", id: 6, date: "20220718", dayOfWeek: "Tuesday")
    }
}
