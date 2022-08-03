//
//  AddEntryView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

struct AddEntryView: View {
    var dayId: Int
    @Binding var change: Bool
    @State var pageNum: Int = 0
    @State var moodScore: Double = 5.0
    @State var selectedActivities: [String] = []
    @State var selectedFeelings: [String] = []
    @State var title: String = ""
    @State var memo: String = ""
    var body: some View {
        ZStack {
            //change state is broken
//            if change {
                if pageNum == 0 {
                VStack{
                    //change is broken
//                    HStack {
//                        Button(action: {
//                            change = false
//                        }){
//                            Text("X")
//                        }
//                        .frame(maxWidth: .infinity, maxHeight: 15, alignment: .trailing)
//                        .padding(.trailing)
//                    }
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
//                        HStack {
//                            Button(action: {
//                                change = false
//                            }){
//                                Text("X")
//                            }
//                            .frame(maxWidth: .infinity, maxHeight: 15, alignment: .trailing)
//                            .padding(.trailing)
//                        }
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
//                        HStack {
//                            Button(action: {
//                                change = false
//                            }){
//                                Text("X")
//                            }
//                            .frame(maxWidth: .infinity, maxHeight: 15, alignment: .trailing)
//                            .padding(.trailing)
//                        }
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
//                        HStack {
//                            Button(action: {
//                                change = false
//                            }){
//                                Text("X")
//                            }
//                            .frame(maxWidth: .infinity, maxHeight: 15, alignment: .trailing)
//                            .padding(.trailing)
//                        }
                        
                        Text(NSDate.now.formatted(date: .long, time: .shortened))
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding()
                            .textCase(.uppercase)
                        Text("ACTIVITIES")
                            .foregroundColor(Color(hue: 0.471, saturation: 0.948, brightness: 0.563))
                            .font(.system(size: 45))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                            .padding(.leading, 40)
                        Text("FEELINGS")
                            .foregroundColor(Color(hue: 0.471, saturation: 0.948, brightness: 0.563))
                            .font(.system(size: 45))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                            .padding(.leading, 40)
                        TextField(
                            "Title...",
                            text: $title
                        )
                        .textFieldStyle(.roundedBorder)
                        
                        .frame(maxWidth: 320, maxHeight: 50, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .padding()
                        .foregroundColor(.black)
                        TextEditor(
                            text: $memo
                        )
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 320, maxHeight: 250, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(hue: 0.471, saturation: 0.014, brightness: 0.936)))
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        Spacer()
                        //Activities list
                        SubmitButton(moodScore: moodScore, selectedActivities: selectedActivities, selectedFeelings: selectedFeelings, title: title, memo: memo, dayId: dayId)
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
//        .zIndex(1)
//        .background(Color(red: 0.493, green: 0.921, blue: 0.795))
//        .transition(AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
//        .onAppear {
//                       change = true
//        }.onDisappear{
//            change = false
//
//        }
//    }
}



struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView(dayId: 3, change: .constant(true))
    }
}
