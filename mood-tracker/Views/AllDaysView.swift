//
//  AllDaysView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

struct AllDaysView: View {
    @Binding var entryAdded: Bool
    var allDaysManager = AllDaysManager()
    @State var days: [AllDaysResponseBody]?
    var body: some View {
        if let days = days {
            let numDays = getNumDaysWithEntries(days: days)
            let numEntries = getNumEntries(days: days)
            ScrollView(.vertical, showsIndicators: false) {
                Text("Your Entries")
                    .foregroundColor(Color(hue: 0.471, saturation: 0.948, brightness: 0.563))
                    .font(.system(size: 55))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                HStack{
                    Text("\(numDays) Days")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                        .padding(.leading, 30).padding(.top).padding(.bottom)

                    Text("\(numEntries) Entries")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(maxWidth: .infinity, maxHeight: 100, alignment: .trailing)
                        .padding(.trailing, 30)
                }
                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                .background(Color(hue: 1.0, saturation: 0.01, brightness: 0.79))
                .cornerRadius(20)
                .shadow(color: .black, radius: 10, x: 5, y: 5)
                .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
                .padding(.leading, 30).padding(.trailing, 30).padding(.bottom, 10)
              
                
                DaysList(days: days)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.493, green: 0.921, blue: 0.795))
            .preferredColorScheme(.light)
//            .onAppear{
//                entryAdded = false
//            }
        }else {
            LoadingView()
                .task {
                    do {
                        days = try await allDaysManager.getAllDays()
                    }catch {
                        print("Error getting all days' data: \(error)")
                }
            }
        }
    }
}

struct AllDaysView_Previews: PreviewProvider {
    static var previews: some View {
        AllDaysView(entryAdded: .constant(true))
    }
}
