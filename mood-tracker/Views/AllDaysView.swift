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
                ZStack{
                    VStack {
                        Text("Your Entries")
                            .fontWeight(.bold)
                            .padding(.top, 50)
                            .foregroundStyle(.linearGradient(colors: [Color(hex: "FF9999")!, Color(hex:"FFCCB3")!], startPoint: .leading, endPoint: .trailing))
                            .font(.system(size: 55))
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    
                    VStack{
                        Spacer(minLength: 100)
                        HStack{
                            Text("\(numDays) Days")
                                .foregroundColor(Color(hex: "330000"))
                                .font(.title)
                                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                                .padding(.leading, 30).padding(.top).padding(.bottom)

                            Text("\(numEntries) Entries")
                                .foregroundColor(Color(hex: "330000"))
                                .font(.title)
                                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .trailing)
                                .padding(.trailing, 30)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 80, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .black, radius: 10, x: 5, y: 5)
                        .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
                        .padding(.leading, 30).padding(.trailing, 30).padding(.bottom, 10)
                      
                        DaysList(days: days)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "EEEFFC"))
        .edgesIgnoringSafeArea(.all)
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
