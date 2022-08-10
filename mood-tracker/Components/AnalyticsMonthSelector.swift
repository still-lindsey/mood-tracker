//
//  AnalyticsMonthSelector.swift
//  mood_tracker
//
//  Created by Lindsey M Still on 8/10/22.
//

import SwiftUI

struct AnalyticsMonthSelector: View {
    @Binding var selectedMonth: Int
    @Binding var selectedMonthName: String
    var body: some View {
        HStack{
            VStack{
                Text("THIS MONTH")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(.horizontal, 30)
                Text("\(selectedMonthName)")
                    .textCase(.uppercase)
                    .font(.body)
                    .foregroundColor(Color.gray.opacity(0.7))
                    .padding(.horizontal, 30)
            }
            Spacer()
            Button{
                self.selectedMonth -= 1
            }label : {
                Image(systemName: "lessthan")
                    .frame(maxWidth: 20, maxHeight: 20, alignment: .center)
                    .foregroundColor(Color.gray)
                    .font(.body)
                    .buttonStyle(PlainButtonStyle())
                    .padding(.trailing, 30)
            }
            .disabled(selectedMonth == 11) //when you reset db change this to 1
            Button{
                self.selectedMonth += 1
            }label : {
                Image(systemName: "greaterthan")
                    .frame(maxWidth: 20, maxHeight: 20, alignment: .center)
                    .foregroundColor(Color.gray)
                    .font(.body)
                    .buttonStyle(PlainButtonStyle())
                    .padding(.trailing, 30)
            }
            .disabled(selectedMonth == 11) //when you reset db change this to length of months
            
        }
        .frame(minWidth: 300, maxWidth: .infinity, minHeight: 80, maxHeight: 80, alignment: .center)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black, radius: 10, x: 5, y: 5)
        .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
        .padding(.leading, 30).padding(.trailing, 30)
        .offset(x: 0, y: 120)
        
    }
}

struct AnalyticsMonthSelector_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsMonthSelector(selectedMonth: .constant(0), selectedMonthName: .constant("Jul"))
    }
}
