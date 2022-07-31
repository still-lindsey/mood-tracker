//
//  TabBar.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

struct TabBar: View {
    @State var selectedTab: Tab = .home
    @State var color: Color = .gray
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                case .quotes:
                    ContentView()
                case .addEntry:
                    AddEntryView()
                case .analytics:
                    ContentView()
                case .allDays:
                    ContentView()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.bottom)
        ZStack () {
            HStack {
                ForEach(tabItems) {item in
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                            selectedTab = item.tab
                            color = item.color
                        }
                    }label: {
                        VStack(spacing: 0){
                            Image(systemName: item.icon)
                                .font(.title)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 70, alignment: .top)
                        .padding(.top)
                        .padding(.bottom)
                    }
                }
            }
        }
        .background(Color(.white))
        .cornerRadius(40, corners: [.topLeft, .topRight])
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
