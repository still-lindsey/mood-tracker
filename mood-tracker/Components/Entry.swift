//
//  Entry.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 8/4/22.
//

import SwiftUI

struct Entry: View {
    let moodScore: Double
    let title: String
    let memo: String
    let activities: [String]
    let feelings: [String]
    let timeStamp: String
    let entryId: Int
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Image(uiImage: getMoodDescriptionandIcon(moodScore:moodScore).1!)
                        .resizable()
                        .frame(width: 120.0, height: 120.0)
                    
                }
                .frame(width: 70.0, height: 70.0)
                .background(.linearGradient(colors: [Color(hex: "FF9999")!, Color(hex:"FFCCB3")!], startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                
                VStack{
                    Text(title)
                        .foregroundColor(Color(hex: "383D47")?.opacity(0.8))
                        .font(.system(.title2, design: .rounded))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    HStack{
                        Text("\(getAMPMTimeFromGMT(GMT: String(timeStamp.suffix(12))))")
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .foregroundColor(Color(hex: "CCCDD6"))
                            .font(.system(.body, design: .rounded))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, maxHeight: 70, alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.leading, 20).padding(.trailing, 20).padding(.top, 15)
            if memo != "" {
                VStack{
                    //add feature to only display certain preview of memo and click to expand page to see full memo
                    Text(memo)
                        .padding(.horizontal, 20).padding(.vertical, 10)
                        .foregroundColor(Color(hex: "383D47")?.opacity(0.8))
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.system(.body, design: .rounded))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }else{
                Spacer(minLength: 10)
            }
            
            
            TagCloudView(tags: activities + feelings)
            Spacer(minLength: 10)

        }
        .background(Color.white)
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .shadow(color: .black, radius: 10, x: 5, y: 5)
        .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
        .padding(.leading).padding(.trailing).padding(.bottom, 20)
    }
}

struct Entry_Previews: PreviewProvider {
    static var previews: some View {
        Entry(moodScore: 9.0, title: "Hi", memo: "Hi", activities: ["hi"], feelings: ["running"], timeStamp: "Monday July 18", entryId: 9)
    }
}
