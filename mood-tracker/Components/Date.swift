//
//  Date.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

//need generator for days list

struct Date: View {
    var date: String
    var dayOfWeek: String
    var month: String
    var body: some View {
        ZStack () {
            VStack (spacing: 20){
                Text("Today")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                Text("\(dayOfWeek), \(month) \(getDayOfMonth(date: date))")
                    .textCase(.uppercase)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                
//                PreviousDates(date:  getDayOfMonth(date: day.date) ?? <#default value#>)
                //need to research loop creation
            }
            .padding()
            .padding(.top)
            .padding(.bottom)
            .padding(.leading)
        }
        .background(Color(hue: 0.471, saturation: 0.948, brightness: 0.563))
        .cornerRadius(90, corners: [.bottomLeft, .bottomRight])
        .edgesIgnoringSafeArea(.top)
    }
}

struct Date_Previews: PreviewProvider {
    static var previews: some View {
        Date(date: "20220731", dayOfWeek: "Sunday", month: "July")
    }
}
