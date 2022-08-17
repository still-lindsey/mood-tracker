//
//  AllDaysView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

struct AllDaysView: View {
    var allDaysManager = AllDaysManager()
    @State var days: [AllDaysResponseBody] = []
    var body: some View {
        let numDays = getNumDaysWithEntries(days: self.days)
        let numEntries = getNumEntries(days: self.days)
        ScrollView(.vertical, showsIndicators: false) {
            ZStack{
                VStack {
                    
                    Text("Your Entries")
                        .fontWeight(.bold)
                        .padding(.top, 50)
                        .foregroundStyle(.linearGradient(colors: [Color(hex: "FF9999")!, Color(hex:"FFCCB3")!], startPoint: .leading, endPoint: .trailing))
                        .font(.system(size: 55, design: .rounded))
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
                VStack{
                    Spacer(minLength: 100)
                    HStack{
                        if numDays == 1 {
                        Text("\(numDays) Day")
                            .foregroundColor(Color(hex: "383D47")?.opacity(0.8))
                            .font(.system(.title, design: .rounded))
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                            .padding(.leading, 30).padding(.top).padding(.bottom)
                        }else{
                            Text("\(numDays) Days")
                                .foregroundColor(Color(hex: "383D47")?.opacity(0.8))
                                .font(.system(.title, design: .rounded))
                                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                                .padding(.leading, 30).padding(.top).padding(.bottom)
                        }
                        if numEntries == 1{
                        Text("\(numEntries) Entry")
                            .foregroundColor(Color(hex: "383D47")?.opacity(0.8))
                            .font(.system(.title, design: .rounded))
                            .frame(maxWidth: .infinity, maxHeight: 100, alignment: .trailing)
                            .padding(.trailing, 30)
                        }else{
                            Text("\(numEntries) Entries")
                                .foregroundColor(Color(hex: "383D47")?.opacity(0.8))
                                .font(.system(.title, design: .rounded))
                                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .trailing)
                                .padding(.trailing, 30)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 80, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .black, radius: 10, x: 5, y: 5)
                    .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
                    .padding(.leading).padding(.trailing).padding(.bottom, 10)
                  
                    DaysList(days: $days)

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color(hex: "EEEFFC"))
    .edgesIgnoringSafeArea(.all)
    .onAppear{
        getAllDaysData()
    }
    }
    func getAllDaysData(){
        Task{
            do {
                let result = try await allDaysManager.getAllDays()
                withAnimation(.easeIn(duration: 1)){
                    days = result
                }
            }catch {
                print("Error getting all days' data: \(error)")
        }
        }
    }
}

struct AllDaysView_Previews: PreviewProvider {
    static var previews: some View {
        AllDaysView(days: previewDays)
    }
}
