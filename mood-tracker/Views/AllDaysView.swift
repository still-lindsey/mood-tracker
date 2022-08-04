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
            let numDays = days.count
            //helper function to get num entries
            VStack() {
                Text("Your Entries")
                    .foregroundColor(Color(hue: 0.471, saturation: 0.948, brightness: 0.563))
                    .font(.system(size: 45))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                HStack{
                    Text("\(numDays) Days")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                        .padding(.leading, 40)
                    Text("idk Entries")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(maxWidth: .infinity, maxHeight: 100, alignment: .trailing)
                        .padding(.trailing, 40)
                }
                .background(Color(hue: 0.471, saturation: 0.948, brightness: 0.563))
                .cornerRadius(40)
                .padding()
                //Days List>Day>Entries List> Entry
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
