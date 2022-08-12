
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
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                            .padding(.top)
                            .foregroundColor(.white)
                        Text("How are you feeling today?")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Image(uiImage: getMoodDescriptionandIcon(moodScore:moodScore).1!)
                            .resizable()
                            .frame(width: 100.0, height: 100.0)
                        Text(getMoodDescriptionandIcon(moodScore:moodScore).0)
                            .textCase(.uppercase)
                            .font(.system(.title2, design: .rounded))
                            .foregroundColor(.white)
                        MoodScoreSlider(moodScore: $moodScore, moodScoreDidChange: $moodScoreDidChange)
                        ContinueButton(pageNum: $pageNum)
                            .disabled(!moodScoreDidChange)
                            .overlay(Color.black.opacity(moodScoreDidChange ? 0.0 : 0.4).cornerRadius(25))
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    } else if pageNum == 1 {
                        VStack{
                            CancelButton(selectedTab: $selectedTab)
                            Text("What's making your day \(getMoodDescriptionandIcon(moodScore:moodScore).0.lowercased())?")
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                            Text("SELECT UP TO 10 ACTIVITIES")
                                .font(.system(size: 20, design: .rounded))
                                .foregroundColor(Color(hex: "383D47")?.opacity(0.5))
                            Spacer()
                            ActivitiesList(selectedActivities: $selectedActivities)
                            Spacer()
                            ContinueButton(pageNum: $pageNum)
                                .disabled(selectedActivities.count == 0)
                                .overlay(Color.black.opacity(selectedActivities.count == 0 ? 0.4 : 0.0).cornerRadius(25))
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .multilineTextAlignment(.center)
                    }else if pageNum == 2{
                        VStack{
                            CancelButton(selectedTab: $selectedTab)
                            Text("...and how are you feeling about this?")
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                            Text("SELECT UP TO 10 FEELINGS")
                                .font(.system(size: 20, design: .rounded))
                                .foregroundColor(Color(hex: "383D47")?.opacity(0.5))
                            Spacer()
                            FeelingsList(selectedFeelings: $selectedFeelings)
                            Spacer()
                            ContinueButton(pageNum: $pageNum)
                                .disabled(selectedFeelings.count == 0)
                                .overlay(Color.black.opacity(selectedFeelings.count == 0 ? 0.4 : 0.0).cornerRadius(25))
                            Spacer()
                        }
                        .multilineTextAlignment(.center)
                    }else if pageNum == 3{
                        VStack{
                            CancelButton(selectedTab: $selectedTab)
                            Text(NSDate.now.formatted(date: .long, time: .shortened))
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding()
                                .textCase(.uppercase)
                            ZStack{
                                VStack{
                                Text("ACTIVITIES")
                                    .foregroundColor(Color(hex: "383D47")?.opacity(0.3))
                                    .font(.system(size: 55, design: .rounded))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                                    .padding(.bottom)
                                Text("FEELINGS")
                                        .foregroundColor(Color(hex: "383D47")?.opacity(0.3))
                                        .font(.system(size: 55, design: .rounded))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                                    .padding(.bottom)
                                }
                                VStack {
                                    ScrollView(.horizontal, showsIndicators: false){
                                        HStack(spacing: 10){
                                        ForEach(selectedActivities, id: \.self){item in
                                            HStack {
                                                Image(systemName: activityIconDict[item]!)
                                                    .font(.title2)
                                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                                    .foregroundColor(Color(hex: "FF9999")!)
                                                Text(item)
                                                    .font(.system(size: 15, design: .rounded))
                                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                                    .foregroundColor(Color(hex: "FF9999")!)
                                            }
                                            .frame(minWidth: 100, maxWidth: 100, minHeight: 30, maxHeight: 30, alignment: .leading)
                                            .background(
                                                RoundedRectangle(cornerRadius: 25)
                                                    .fill(Color.white.opacity(0.95)))
                                                
                                            }
                                        }
                                        .padding(.top, 35)
                                        
                                    }
                                    .padding(.horizontal, 35)
                                    
                                    ScrollView(.horizontal, showsIndicators: false){
                                        HStack(spacing: 10){
                                        ForEach(selectedFeelings, id: \.self){item in
                                            HStack {
                                                Text(feelingIconDict[item]!)
                                                    .font(.system(.title2, design: .rounded))
                                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                                Text(item)
                                                    .font(.system(size: 15, design: .rounded))
                                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                                    .foregroundColor(Color(hex: "FF9999")!)
                                            }
                                            .frame(minWidth: 100, maxWidth: 100, minHeight: 30, maxHeight: 30, alignment: .leading)
                                            .background(
                                                RoundedRectangle(cornerRadius: 25)
                                                    .fill(Color.white.opacity(0.95)))
                                            }
                                        }
                                        .padding(.top, 35)
                                    }
                                    .padding(.horizontal, 35)
                                }
                            }
                            TextField(
                                "Title...",
                                text: $title
                            )
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(TextAlignment.leading)
                            .font(.system(.title3, design: .rounded))
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
                                    .font(.system(.body, design: .rounded))
                                    .foregroundColor(.gray)
                                    
                                    .padding()
                                    .multilineTextAlignment(TextAlignment.leading)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                                   
                                    .opacity(self.memo.isEmpty ? 0.25 : 1)
                                    .padding(.leading, 30).padding(.trailing, 30)
                            Spacer()
                        }
                            .multilineTextAlignment(.center)
                        SubmitButton(moodScore: moodScore, selectedActivities: selectedActivities, selectedFeelings: selectedFeelings, title: $title, memo: memo, dayId: dayId, selectedTab: $selectedTab)
//                                .disabled(title == "" || memo == "")
//                                .overlay(Color.black.opacity(title == "" || memo == "" ? 0.4 : 0.0).cornerRadius(25))
                        Spacer()
                    }
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
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.linearGradient(colors: [Color(hex: "FF9999")!, Color(hex:"FFCCB3")!], startPoint: .leading, endPoint: .trailing))
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

