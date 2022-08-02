//
//  ActivitiesList.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 8/2/22.
//

import SwiftUI

struct ActivitiesList: View {
    @Binding var selectedActivities: [String]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack{
                HStack(spacing: 20) {
                    ForEach(activityItems[..<7]) { item in
                        let i = activityItems.firstIndex(of: item)
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                                let updatedSelect = !item.isSelected
                                let newVal = ActivityItem(id: item.id, text: item.text, icon: item.icon, isSelected: updatedSelect)
                                activityItems[i!] = newVal
                                print(activityItems[i!].isSelected)
                                if activityItems[i!].isSelected {
                                    selectedActivities.append(item.text)
                                }else{
                                    let modifiedArray = selectedActivities.filter { $0 != activityItems[i!].text }
                                    selectedActivities = modifiedArray
                                }
                            }
                        }label: {
                            VStack(spacing: 0){
                                Image(systemName: item.icon)
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                Text(item.text)
                                    .font(.body)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            }
                            .frame(minWidth: 90, maxWidth: .infinity, maxHeight: 50, alignment: .top)
                            .padding(.top)
                            .padding(.bottom)
                            .foregroundColor(.white)
                            .disabled(true)
                             .background(
                                 RoundedRectangle(cornerRadius: 25)
                                    .fill(Color(.clear))
                             )
                             .buttonStyle(PlainButtonStyle())
                            
                        }
                        .disabled(activityItems[i!].isSelected)
                    }
                }
                HStack(spacing: 20) {
                    ForEach(activityItems[7..<14]) { item in
                        let i = activityItems.firstIndex(of: item)
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                                let updatedSelect = !item.isSelected
                                let newVal = ActivityItem(id: item.id, text: item.text, icon: item.icon, isSelected: updatedSelect)
                                activityItems[i!] = newVal
                                print(activityItems[i!].isSelected)
                                if activityItems[i!].isSelected {
                                    selectedActivities.append(item.text)
                                }else{
                                    let modifiedArray = selectedActivities.filter { $0 != activityItems[i!].text }
                                    selectedActivities = modifiedArray
                                }
                            }
                        }label: {
                            VStack(spacing: 0){
                                Image(systemName: item.icon)
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                Text(item.text)
                                    .font(.body)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            }
                            .frame(minWidth: 90, maxWidth: .infinity, maxHeight: 50, alignment: .top)
                            .padding(.top)
                            .padding(.bottom)
                            .foregroundColor(.white)
                             .background(
                                 RoundedRectangle(cornerRadius: 25)
                                    .fill(Color(.clear))
                             )
                             .buttonStyle(PlainButtonStyle())
                        }
                        .disabled(activityItems[i!].isSelected)
                    }
                }
                HStack(spacing: 20) {
                    ForEach(activityItems[14...]) { item in
                        let i = activityItems.firstIndex(of: item)
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                                let updatedSelect = !item.isSelected
                                let newVal = ActivityItem(id: item.id, text: item.text, icon: item.icon, isSelected: updatedSelect)
                                activityItems[i!] = newVal
                                print(activityItems[i!].isSelected)
                                if activityItems[i!].isSelected {
                                    selectedActivities.append(item.text)
                                }else{
                                    let modifiedArray = selectedActivities.filter { $0 != activityItems[i!].text }
                                    selectedActivities = modifiedArray
                                }
                            }
                        }label: {
                            VStack(spacing: 0){
                                Image(systemName: item.icon)
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                Text(item.text)
                                    .font(.body)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            }
                            .frame(minWidth: 90, maxWidth: 90, maxHeight: 50, alignment: .center)
                            //last row has 90 max width to line up with rows above it
                            .padding(.top)
                            .padding(.bottom)
                            .foregroundColor(.white)
                             .background(
                                 RoundedRectangle(cornerRadius: 25)
                                    .fill(Color(.clear))
                             )
                             .buttonStyle(PlainButtonStyle())
                        }
                        .disabled(activityItems[i!].isSelected)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                //to check if state update and remove is working
                ForEach(selectedActivities, id: \.self) { item in
                  Text(item)
                }
            }
        }
    }
}

struct ActivitiesList_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesList(selectedActivities: .constant(["work", "family"]))
    }
}
