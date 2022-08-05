

//
//  AddEntryView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//
import SwiftUI

struct AddEntryView: View {
    var dayManager = DayManager()
    @State var day: NewDayResponseBody?
    @Binding var selectedTab: MenuTabs
    @State var cancelled: Bool = false
    @State var pageNum: Int = 0
    @State var moodScore: Double = 5.0
    @State var moodScoreDidChange: Bool = false
    @State var selectedActivities: [String] = []
    @State var selectedFeelings: [String] = []
    @State var title: String = ""
    @State var memo: String = ""
    @State var placeholder: String = "Memo. . ."
    var body: some View {
        if let day = day {
            let dayId: Int = day.day_id
            ZStack {
                if pageNum == 0{
                    VStack{
                        CancelButton(selectedTab: $selectedTab)
                        Text("Hey Lindsey.")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top)
                            .foregroundColor(.white)
                        Text("How are you feeling today?")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Image(uiImage: getMoodDescriptionandIcon(moodScore:moodScore).1!)
                            .resizable()
                            .frame(width: 100.0, height: 100.0)
                        Text(getMoodDescriptionandIcon(moodScore:moodScore).0)
                            .textCase(.uppercase)
                            .font(.title2)
                            .foregroundColor(.white)
                        MoodScoreSlider(moodScore: $moodScore, moodScoreDidChange: $moodScoreDidChange)
                        ContinueButton(pageNum: $pageNum)
                            .disabled(!moodScoreDidChange)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(red: 0.493, green: 0.921, blue: 0.795))
                    .preferredColorScheme(.light)
                    .frame(maxWidth: .infinity)
                    } else if pageNum == 1 {
                        VStack{
                            CancelButton(selectedTab: $selectedTab)
                            Text("What's making your day \(getMoodDescriptionandIcon(moodScore:moodScore).0)?")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                            Text("SELECT UP TO 10 ACTIVITIES")
                                .foregroundColor(Color(hue: 0.471, saturation: 0.948, brightness: 0.563))
                            Spacer()
                            ActivitiesList(selectedActivities: $selectedActivities)
                            Spacer()
                            ContinueButton(pageNum: $pageNum)
                                .disabled(selectedActivities.count == 0)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color(red: 0.493, green: 0.921, blue: 0.795))
                        .preferredColorScheme(.light)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    }else if pageNum == 2{
                        VStack{
                            CancelButton(selectedTab: $selectedTab)
                            Text("...and how are you feeling about this?")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                            Text("SELECT UP TO 10 FEELINGS")
                                .foregroundColor(Color(hue: 0.471, saturation: 0.948, brightness: 0.563))
                            Spacer()
                            FeelingsList(selectedFeelings: $selectedFeelings)
                            Spacer()
                            ContinueButton(pageNum: $pageNum)
                                .disabled(selectedFeelings.count == 0)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color(red: 0.493, green: 0.921, blue: 0.795))
                        .preferredColorScheme(.light)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    }else if pageNum == 3{
                        VStack{
                            CancelButton(selectedTab: $selectedTab)
                            Text(NSDate.now.formatted(date: .long, time: .shortened))
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding()
                                .textCase(.uppercase)
                            Text("ACTIVITIES")
                                .foregroundColor(Color(hue: 0.471, saturation: 0.948, brightness: 0.563))
                                .font(.system(size: 45))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                            Text("FEELINGS")
                                .foregroundColor(Color(hue: 0.471, saturation: 0.948, brightness: 0.563))
                                .font(.system(size: 45))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                            TextField(
                                "Title...",
                                text: $title
                            )
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(TextAlignment.leading)
                            .font(.title3)
                            .frame(maxWidth: .infinity, maxHeight: 70, alignment: .leading)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .padding(.leading, 30).padding(.trailing, 30)
                            .foregroundColor(.gray)
                            ZStack(alignment: .leading) {
                                if self.memo.isEmpty {
                                    TextEditor(text:$placeholder)
                                                    .font(.body)
                                                    .foregroundColor(.gray)
                                                    .disabled(true)
                                                    .padding()
                                                    .multilineTextAlignment(TextAlignment.leading)
                                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                                                    .padding(.leading, 30).padding(.trailing, 30)
                                }
                                TextEditor(text: $memo)
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    
                                    .padding()
                                    .multilineTextAlignment(TextAlignment.leading)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                                   
                                    .opacity(self.memo.isEmpty ? 0.25 : 1)
                                    .padding(.leading, 30).padding(.trailing, 30)
                            Spacer()
                        }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color(red: 0.493, green: 0.921, blue: 0.795))
                            .preferredColorScheme(.light)
                            .multilineTextAlignment(.center)
                        SubmitButton(moodScore: moodScore, selectedActivities: selectedActivities, selectedFeelings: selectedFeelings, title: title, memo: memo, dayId: dayId, selectedTab: $selectedTab)
                                .disabled(title == "" || memo == "")
                        Spacer()
                    }
                        .background(Color(red: 0.493, green: 0.921, blue: 0.795))
                        .onDisappear{
                            pageNum = 0
                            moodScore = 5.0
                            selectedActivities = []
                            selectedFeelings = []
                            title = ""
                            memo = ""
                            moodScoreDidChange = false
                        }
                    }
            }

                    }else{
                        LoadingView()
                            .task {
                                do {
                                    day = try await dayManager.postNewDay()
                                }catch {
                                    print("Error getting today's data: \(error)")
                            }
                        }
                    }
    }
}

struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView( selectedTab: .constant(.first))
    }
}
