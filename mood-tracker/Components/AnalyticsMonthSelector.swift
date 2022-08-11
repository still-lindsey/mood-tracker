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
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                    .padding(.horizontal)
                Text("\(selectedMonthName)")
                    .textCase(.uppercase)
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(Color(hex: "383D47")?.opacity(0.3))
                    .padding(.horizontal)
            }
            Spacer()
            Button{
                self.selectedMonth -= 1
            }label : {
                Image(systemName: "lessthan")
                    .frame(maxWidth: 20, maxHeight: 20, alignment: .center)
                    .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                    .font(.system(.body, design: .rounded))
                    .buttonStyle(PlainButtonStyle())
                    .padding(.trailing)
            }
            .disabled(true) //when you reset db change this to 1
            Button{
                self.selectedMonth += 1
            }label : {
                Image(systemName: "greaterthan")
                    .frame(maxWidth: 20, maxHeight: 20, alignment: .center)
                    .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                    .font(.system(.body, design: .rounded))
                    .buttonStyle(PlainButtonStyle())
                    .padding(.trailing)
            }
            .disabled(true) //when you reset db change this to length of months
            
        }
        .frame(minWidth: 300, maxWidth: .infinity, minHeight: 80, maxHeight: 80, alignment: .center)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black, radius: 10, x: 5, y: 5)
        .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
        .padding(.leading).padding(.trailing)
        .offset(x: 0, y: 120)
        
    }
}

struct AnalyticsMonthSelector_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsMonthSelector(selectedMonth: .constant(0), selectedMonthName: .constant("Jul"))
    }
}
