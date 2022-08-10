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
        let date1 = getDateObjectFromDbDateString(date: date, dayOfWeek: dayOfWeek, month: month)
        let interval = date1.timeIntervalSinceNow
        let timeAgo: Double = getDaysFromSeconds(seconds: interval) //Time ago in rounded days
        let timeAgoString = getTimeAgoConvertedString(timeAgo: timeAgo)
        VStack{
            HStack{
                VStack{
                    Text(date.suffix(2))
                    Text(month.prefix(3).uppercased())
                }
                .foregroundColor(Color(hex: "330000")?.opacity(0.8))
                .frame(maxWidth: 70, maxHeight: .infinity, alignment: .center)
                .background(Color(hex: "CCCDD6"))
                .cornerRadius(20)
                .padding()
                VStack{
                    
                    Text(dayOfWeek)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(.top)
                        .font(.title)
                        .foregroundColor(Color(hex: "330000")?.opacity(0.8))
                    
                        
                    Text("\(timeAgoString)")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(.bottom)
                        .font(.title3)
                        .foregroundColor(Color(hex: "CCCDD6"))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                
            }
            .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
            .padding(.leading)
            .padding(.trailing)
            ForEach(entries.reversed(), id: \.self){entry in
                Entry(moodScore: entry.mood_score, title: entry.title, memo: entry.memo, activities: entry.activities, feelings: entry.emotions, timeStamp: entry.time_stamp, entryId: entry.entry_id)
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct Day_Previews: PreviewProvider {
    static var previews: some View {
        Day(entries: previewEntries, month: "July", id: 6, date: "20220718", dayOfWeek: "Tuesday")
    }
}
