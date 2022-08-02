//
//  AddEntryView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

struct AddEntryView: View {
    var dayId: Int
    @State var pageNum: Int = 0
    @State var moodScore: Double = 5.0
    @State var hidden: Bool = false
    @State var selectedActivities: [String] = []
    @State var selectedFeelings: [String] = []
    var body: some View {
        if !hidden {
            if pageNum == 0 {
            VStack{
                //Bug in Cancel button
//                CancelButton(hidden: $hidden)
                Text("Hey Lindsey.")
                    .font(.title)
                    .padding(.top)
                    .foregroundColor(.white)
                Text("How are you feeling today?")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                Image(uiImage: getMoodDescriptionandIcon(moodScore:moodScore).1!)
                    .resizable()
                    .frame(width: 100.0, height: 100.0)
                Text(getMoodDescriptionandIcon(moodScore:moodScore).0)
                    .textCase(.uppercase)
                    .font(.title2)
                    .foregroundColor(.white)
                MoodScoreSlider(moodScore: $moodScore)
                ContinueButton(pageNum: $pageNum)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.493, green: 0.921, blue: 0.795))
            .preferredColorScheme(.light)
            .frame(maxWidth: .infinity)
            } else if pageNum == 1 {
                VStack{
                    //Bug in Cancel button
    //                CancelButton(hidden: $hidden)
                    Text("What's making your day \(getMoodDescriptionandIcon(moodScore:moodScore).0)?")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    Text("SELECT UP TO 3 ACTIVITIES")
                        .foregroundColor(Color(hue: 0.471, saturation: 0.948, brightness: 0.563))
                    Spacer()
                    ActivitiesList(selectedActivities: $selectedActivities)
                    Spacer()
                    ContinueButton(pageNum: $pageNum)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 0.493, green: 0.921, blue: 0.795))
                .preferredColorScheme(.light)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            }else if pageNum == 2 {
                VStack{
                    //Bug in Cancel button
    //                CancelButton(hidden: $hidden)
                    Text("...and how are you feeling about this?")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    Text("SELECT UP TO 3 FEELINGS")
                        .foregroundColor(Color(hue: 0.471, saturation: 0.948, brightness: 0.563))
                    Spacer()
                    FeelingsList(selectedFeelings: $selectedFeelings)
                    Spacer()
                    ContinueButton(pageNum: $pageNum)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 0.493, green: 0.921, blue: 0.795))
                .preferredColorScheme(.light)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            }else if pageNum == 3 {
                VStack{
                    //Bug in Cancel button
    //                CancelButton(hidden: $hidden)
                    Text("...and how are you feeling about this?")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    Text("SELECT UP TO 3 FEELINGS")
                        .foregroundColor(Color(hue: 0.471, saturation: 0.948, brightness: 0.563))
                    Spacer()
                    //Activities list
                    ContinueButton(pageNum: $pageNum)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 0.493, green: 0.921, blue: 0.795))
                .preferredColorScheme(.light)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            }
        }
    }
}


struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView(dayId: 3)
    }
}
