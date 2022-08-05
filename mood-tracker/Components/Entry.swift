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
                Image(uiImage: getMoodDescriptionandIcon(moodScore:moodScore).1!)
                    .resizable()
                    .frame(width: 70.0, height: 70.0)
                VStack{
                    Text(title)
                        .foregroundColor(.white)
                        .font(.title2)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    HStack{
                        Text("\(getAMPMTimeFromGMT(GMT: String(timeStamp.suffix(12))))")
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, maxHeight: 120, alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.leading, 20).padding(.trailing, 20).padding(.top, 20)
            Text(memo)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(20)
                .foregroundColor(.white)
            TagCloudView(tags: activities + feelings)
            Spacer()

        }
        .background(Color(hue: 0.471, saturation: 0.948, brightness: 0.563))
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: 500, alignment: .center)
        .shadow(color: .black, radius: 10, x: 5, y: 5)
        .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
        .padding(.leading, 27).padding(.trailing, 27).padding(.bottom, 10)
    }
}

struct Entry_Previews: PreviewProvider {
    static var previews: some View {
        Entry(moodScore: 9.0, title: "Hi", memo: "Hi", activities: ["hi"], feelings: ["running"], timeStamp: "Monday July 18", entryId: 9)
    }
}
