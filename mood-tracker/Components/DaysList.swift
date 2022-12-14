//
//  DaysList.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 8/4/22.
//

import SwiftUI

struct DaysList: View {
    @Binding var days: [AllDaysResponseBody]
    var body: some View {
        VStack{
            ForEach(sortDaysById(days: days), id: \.day_id){ day in
                if day.entries.count > 0{
                    Day(entries: day.entries, month: day.month, id: day.day_id, date: day.date, dayOfWeek: day.day_of_week)
                }
            }
        }
    }
}

struct DaysList_Previews: PreviewProvider {
    static var previews: some View {
        DaysList(days: .constant(previewDays))
    }
}
