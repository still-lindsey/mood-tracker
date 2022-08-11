//
//  AnalyticsView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI
import SwiftUICharts

struct AnalyticsView: View {
    @Binding var entryAdded: Bool
    var dayManager = DayManager()
    @State var today: NewDayResponseBody?
    @State var viewType: String = "Monthly"
    @State var monthlyAnalytics: AnalyticsResponse?
    @State var selectedMonth: Int = 0
    @State var selectedMonthName: String = "August"
    var body: some View {
        if let today = today {
            let monthId = today.month_id
            let analyticsManager = AnalyticsManager()
            if let monthlyAnalytics = monthlyAnalytics {
                ZStack() {
                    VStack{
                        RoundedRectangle(cornerRadius: 90, style: .continuous)
                            .foregroundStyle(.linearGradient(colors: [Color(hex: "FF9999")!, Color(hex:"FFCCB3")!], startPoint: .leading, endPoint: .trailing))
                            .frame(maxWidth: .infinity, minHeight: 600, maxHeight: 700, alignment: .leading)
                            .offset(y: -100)
                            .cornerRadius(90, corners: [.bottomLeft, .bottomRight])
                            .edgesIgnoringSafeArea(.top)
                        Spacer()
                    }

                    ScrollView(.vertical, showsIndicators: false){
                        VStack{

                            HStack{
                                Text("\(viewType) Analytics")
                            }
                            .frame(minWidth: 200, maxWidth: 200, minHeight: 40, maxHeight: 40, alignment: .center)
                            .font(.system(.body, design: .rounded))
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.gray.opacity(0.3)))
                                

                            Text(getMoodDescriptionandIcon(moodScore: self.monthlyAnalytics!.month_average_mood).0)
                                .font(.system(.largeTitle, design: .rounded))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.vertical)
                                

                            Text("AVERAGE MOOD: \(String(format: "%.1f", (self.monthlyAnalytics!.month_average_mood * 10)))%")
                                .font(.system(.title3, design: .rounded))
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .padding(.horizontal)
                            
                            

                            let daysAverageMoodsNotNull = getDaysAverageMoodsNotNull(data:monthlyAnalytics.days_average_moods)
                            
                            let indexesAverageMoodsNotNull = getIndexesAverageMoodsNotNull(data:monthlyAnalytics.days_average_moods)
                            
                            LineView(data: daysAverageMoodsNotNull, dataIndexes: indexesAverageMoodsNotNull, month: String(today.month.prefix(3)), year: String(today.date.prefix(4).suffix(2)))
                                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/4)
                                .background(Color.clear)
                                .foregroundColor(.clear)
                            
                                

                            AnalyticsMonthSelector(selectedMonth: $selectedMonth, selectedMonthName: $selectedMonthName)

                            HStack{
                                VStack{
                                    Text("\(self.monthlyAnalytics!.num_negative_days)")
                                        .font(.system(size: 45, design: .rounded))
                                        .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                                    Text("negative days")
                                        .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                                        .padding(.bottom, 10)
                                        .font(.system(.body, design: .rounded))
                                }
                                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(color: .black, radius: 10, x: 5, y: 5)
                                .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
                                VStack{
                                    Text("\(self.monthlyAnalytics!.num_positive_days)")
                                        .font(.system(size: 45, design: .rounded))
                                        .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                                    Text("positive days")
                                        .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                                        .padding(.bottom, 10)
                                        .font(.system(.body, design: .rounded))
                                }
                                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(color: .black, radius: 10, x: 5, y: 5)
                                .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
                            }
                            .padding(.horizontal)
                            .offset(x: 0, y: 130)

                            VStack{
                                Text("What makes you shine")
                                    
                                    .font(.system(.title3, design: .rounded))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                    .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                                    .padding(10)
                                    .padding(.bottom, 0)
                                    .multilineTextAlignment(.leading)
                                    
                                TagCloudView(tags: self.monthlyAnalytics!.positive_activities)
                                    .padding(.bottom, 10)
                                    
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(color: .black, radius: 10, x: 5, y: 5)
                            .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
                            .padding(.horizontal)
                            .offset(x: 0, y: 140)
                            
                            
                            VStack{
                                Text("What gets you down")
                                    
                                    .font(.system(.title3, design: .rounded))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                    .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                                    .padding(10)
                                    .padding(.bottom, 0)
                                    .multilineTextAlignment(.leading)
                                TagCloudView(tags: self.monthlyAnalytics!.negative_activities)
                                    .padding(.bottom, 10)
                                    
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(color: .black, radius: 10, x: 5, y: 5)
                            .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
                            .padding(.horizontal)
                            .offset(x: 0, y: 150)
                           
                            //top activities
                            
                            VStack{
                                Text("Frequent Activities")
                                    
                                    .font(.system(.title3, design: .rounded))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                    .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                                    .padding(10)
                                    .padding(.bottom, 0)
                                    .multilineTextAlignment(.leading)
                                if self.monthlyAnalytics!.top_three_activities_freq.count == 3 {
                                    HStack{
                                        ZStack{
                                            Circle()
                                                .trim(from: 0, to: (self.monthlyAnalytics!.top_three_activities_freq[0].frequency))
                                                .stroke(
                                                    Color(hex: "FF9999")!,
                                                    style: StrokeStyle(
                                                        lineWidth: 10,
                                                        lineCap: .round
                                                    )
                                                )
                                                .rotationEffect(.degrees(-90))
                                                .frame(width: 150, height: 150)
                                            Circle()
                                                .trim(from: 0, to: (self.monthlyAnalytics!.top_three_activities_freq[1].frequency))
                                                .stroke(
                                                    (Color(hex: "FF9999")?.opacity(0.7))!,
                                                    style: StrokeStyle(
                                                        lineWidth: 10,
                                                        lineCap: .round
                                                    )
                                                )
                                                .rotationEffect(.degrees(-90))
                                                .frame(width: 120, height: 120)
                                            Circle()
                                                .trim(from: 0, to: (self.monthlyAnalytics!.top_three_activities_freq[2].frequency))
                                                .stroke(
                                                    (Color(hex: "FF9999")?.opacity(0.4))!,
                                                    style: StrokeStyle(
                                                        lineWidth: 10,
                                                        lineCap: .round
                                                    )
                                                )
                                                .rotationEffect(.degrees(-90))
                                                .frame(width: 90, height: 90)
                                        }
                                        .frame(width: 150, height: 150)
                                        .padding(.trailing, 40)
                                        Spacer()
                                        VStack{
                                            HStack{
                                                Circle()
                                                    .fill(Color(hex: "FF9999")!)
                                                    .frame(width: 10, height: 10)
                                                VStack(alignment: .leading){
                                                    Text("\(self.monthlyAnalytics!.top_three_activities_freq[0].activity)")
                                            .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                                            .font(.system(.body, design: .rounded))
                                                    Text("\(String(format: "%.0f", (self.monthlyAnalytics!.top_three_activities_freq[0].frequency * 100)))%")
                                                        .foregroundColor(Color(hex: "FF9999"))
                                                        .font(.system(.body, design: .rounded))
                                                }
                                                .multilineTextAlignment(.leading)
                                                
                                            }
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                            HStack{
                                                Circle()
                                                    .fill(Color(hex: "FF9999")!.opacity(0.7))
                                                    .frame(width: 10, height: 10)
                                                VStack(alignment: .leading){
                                                    Text("\(self.monthlyAnalytics!.top_three_activities_freq[1].activity)")
                                            .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                                            .font(.system(.body, design: .rounded))
                                                    Text("\(String(format: "%.0f", (self.monthlyAnalytics!.top_three_activities_freq[1].frequency * 100)))%")
                                                        .foregroundColor(Color(hex: "FF9999")?.opacity(0.7))
                                                        .font(.system(.body, design: .rounded))
                                                }
                                                .multilineTextAlignment(.leading)
                                                
                                            }
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                            HStack{
                                                Circle()
                                                    .fill(Color(hex: "FF9999")!.opacity(0.4))
                                                    .frame(width: 10, height: 10)
                                                VStack(alignment: .leading){
                                                    Text("\(self.monthlyAnalytics!.top_three_activities_freq[2].activity)")
                                            .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                                            .font(.system(.body, design: .rounded))
                                                    Text("\(String(format: "%.0f", (self.monthlyAnalytics!.top_three_activities_freq[2].frequency * 100)))%")
                                                        .foregroundColor(Color(hex: "FF9999")?.opacity(0.4))
                                                        .font(.system(.body, design: .rounded))
                                                }
                                                .multilineTextAlignment(.leading)
                                                
                                            }
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                        }
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                    .padding()
                                }else{
                                    Text("Not enough data to calculate. Please submit more entries.")
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(color: .black, radius: 10, x: 5, y: 5)
                            .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
                            .padding(.horizontal)
                            .offset(x: 0, y: 160)
                            
                            VStack{
                                Text("Frequent Feelings")
                                    
                                    .font(.system(.title3, design: .rounded))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                    .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                                    .padding(10)
                                    .padding(.bottom, 0)
                                    .multilineTextAlignment(.leading)
                                if self.monthlyAnalytics!.top_three_feelings_freq.count == 3 {
                                    HStack{
                                        ZStack{
                                            Circle()
                                                .trim(from: 0, to: (self.monthlyAnalytics!.top_three_feelings_freq[0].frequency))
                                                .stroke(
                                                    Color(hex: "FF9999")!,
                                                    style: StrokeStyle(
                                                        lineWidth: 10,
                                                        lineCap: .round
                                                    )
                                                )
                                                .rotationEffect(.degrees(-90))
                                                .frame(width: 150, height: 150)
                                            Circle()
                                                .trim(from: 0, to: (self.monthlyAnalytics!.top_three_feelings_freq[1].frequency))
                                                .stroke(
                                                    (Color(hex: "FF9999")?.opacity(0.7))!,
                                                    style: StrokeStyle(
                                                        lineWidth: 10,
                                                        lineCap: .round
                                                    )
                                                )
                                                .rotationEffect(.degrees(-90))
                                                .frame(width: 120, height: 120)
                                            Circle()
                                                .trim(from: 0, to: (self.monthlyAnalytics!.top_three_feelings_freq[2].frequency))
                                                .stroke(
                                                    (Color(hex: "FF9999")?.opacity(0.4))!,
                                                    style: StrokeStyle(
                                                        lineWidth: 10,
                                                        lineCap: .round
                                                    )
                                                )
                                                .rotationEffect(.degrees(-90))
                                                .frame(width: 90, height: 90)
                                        }
                                        .frame(width: 150, height: 150)
                                        .padding(.trailing, 40)
                                        Spacer()
                                        VStack{
                                            HStack{
                                                Circle()
                                                    .fill(Color(hex: "FF9999")!)
                                                    .frame(width: 10, height: 10)
                                                VStack(alignment: .leading){
                                                    Text("\(self.monthlyAnalytics!.top_three_feelings_freq[0].feeling)")
                                            .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                                            .font(.system(.body, design: .rounded))
                                                    Text("\(String(format: "%.0f", (self.monthlyAnalytics!.top_three_feelings_freq[0].frequency * 100)))%")
                                                        .foregroundColor(Color(hex: "FF9999"))
                                                        .font(.system(.body, design: .rounded))
                                                }
                                                .multilineTextAlignment(.leading)
                                                
                                            }
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                            HStack{
                                                Circle()
                                                    .fill(Color(hex: "FF9999")!.opacity(0.7))
                                                    .frame(width: 10, height: 10)
                                                VStack(alignment: .leading){
                                                    Text("\(self.monthlyAnalytics!.top_three_feelings_freq[1].feeling)")
                                            .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                                            .font(.system(.body, design: .rounded))
                                                    Text("\(String(format: "%.0f", (self.monthlyAnalytics!.top_three_feelings_freq[1].frequency * 100)))%")
                                                        .foregroundColor(Color(hex: "FF9999")?.opacity(0.7))
                                                        .font(.system(.body, design: .rounded))
                                                }
                                                .multilineTextAlignment(.leading)
                                                
                                            }
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                            HStack{
                                                Circle()
                                                    .fill(Color(hex: "FF9999")!.opacity(0.4))
                                                    .frame(width: 10, height: 10)
                                                VStack(alignment: .leading){
                                                    Text("\(self.monthlyAnalytics!.top_three_feelings_freq[2].feeling)")
                                            .foregroundColor(Color(hex: "383D47")?.opacity(0.6))
                                            .font(.system(.body, design: .rounded))
                                                    Text("\(String(format: "%.0f", (self.monthlyAnalytics!.top_three_feelings_freq[2].frequency * 100)))%")
                                                        .foregroundColor(Color(hex: "FF9999")?.opacity(0.4))
                                                        .font(.system(.body, design: .rounded))
                                                }
                                                .multilineTextAlignment(.leading)
                                                
                                            }
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                        }
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                    .padding()
                            }else{
                                Text("Not enough data to calculate. Please submit more entries.")
                            }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(color: .black, radius: 10, x: 5, y: 5)
                            .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
                            .padding(.horizontal)
                            .offset(x: 0, y: 170)
                            
                        }
                        Spacer(minLength: 190)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
            .background(Color(hex: "EEEFFC"))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .onChange(of: self.selectedMonth, perform: { newValue in
                Task{
                    do{
                        self.monthlyAnalytics = try await analyticsManager.getAnalytics(monthId: self.selectedMonth)
                    }catch{
                        
                        print("Error getting analytics: \(error)")
                    }
                }
            })
            .onAppear{
                self.selectedMonth = monthId
                self.selectedMonthName = today.month
            }
            }else{
                LoadingView()
                    .task{
                        do{
                            monthlyAnalytics = try await analyticsManager.getAnalytics(monthId: monthId)
                        }catch{
                            print("Error getting analytics: \(error)")
                        }
                    }
            }
        }else{
            LoadingView()
                .task{
                    do {
                        today = try await dayManager.postNewDay()
                    }catch {
                        print("Error posting day: \(error)")
                    }
                }
        }
    }
}

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView(entryAdded: .constant(true))
    }
}
