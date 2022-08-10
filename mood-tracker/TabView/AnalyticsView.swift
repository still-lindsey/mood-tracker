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
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.gray.opacity(0.3)))
                                

                            Text(getMoodDescriptionandIcon(moodScore: self.monthlyAnalytics!.month_average_mood).0)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .padding(.horizontal, 30)
                                .padding(.vertical)
                                

                            Text("AVERAGE MOOD: \(String(format: "%.1f", (self.monthlyAnalytics!.month_average_mood * 10)))%")
                                .font(.title3)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .padding(.horizontal, 30)
                            
                            

    //                        var daysAverageMoodsNotNull = getDaysAverageMoodsNotNull(data:monthlyAnalytics.days_average_moods)
                            
                            LineView(data: self.monthlyAnalytics!.days_average_moods, month: String(today.month.prefix(3)), year: String(today.date.prefix(4).suffix(2)))
                                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/4)
                                .background(Color.clear)
                                .foregroundColor(.clear)
                            
                                

                            AnalyticsMonthSelector(selectedMonth: $selectedMonth, selectedMonthName: $selectedMonthName)

                            HStack{
                                VStack{
                                    Text("\(self.monthlyAnalytics!.num_negative_days)")
                                        .font(.system(size: 45))
                                        .foregroundColor(Color.gray)
                                    Text("negative days")
                                        .foregroundColor(Color.gray)
                                        .padding(.bottom, 10)
                                }
                                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(color: .black, radius: 10, x: 5, y: 5)
                                .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
                                VStack{
                                    Text("\(self.monthlyAnalytics!.num_positive_days)")
                                        .font(.system(size: 45))
                                        .foregroundColor(Color.gray)
                                    Text("positive days")
                                        .foregroundColor(Color.gray)
                                        .padding(.bottom, 10)
                                }
                                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(color: .black, radius: 10, x: 5, y: 5)
                                .mask(Rectangle().cornerRadius(20).padding(.bottom, -10))
                            }
                            .padding(.horizontal, 30)
                            .offset(x: 0, y: 130)

                            VStack{
                                Text("What makes you shine")
                                    
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                    .foregroundColor(Color.gray)
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
                            .padding(.horizontal, 30)
                            .offset(x: 0, y: 140)
                            
                            
                            VStack{
                                Text("What gets you down")
                                    
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                    .foregroundColor(Color.gray)
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
                            .padding(.horizontal, 30)
                            .offset(x: 0, y: 150)
                           
                            //top activities
                            //top feelings
                            Spacer(minLength: 170)
                        }
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
