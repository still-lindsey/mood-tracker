//
//  FeelingsList.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 8/2/22.
//

import SwiftUI

struct FeelingsList: View {
    @Binding var selectedFeelings: [String]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack{
                HStack(spacing: 20) {
                    ForEach(feelingItems[..<5]) { item in
                        let i = feelingItems.firstIndex(of: item)
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                                let updatedSelect = !item.isSelected
                                let newVal = FeelingItem(id: item.id, text: item.text, icon: item.icon,emoji:item.emoji, isSelected: updatedSelect)
                                feelingItems[i!] = newVal
                                print(feelingItems[i!].isSelected)
                                if feelingItems[i!].isSelected {
                                    selectedFeelings.append(item.text)
                                }else{
                                    let modifiedArray = selectedFeelings.filter { $0 != feelingItems[i!].text }
                                    selectedFeelings = modifiedArray
                                }
                            }
                        }label: {
                            VStack(spacing: 0){
//                                Image(uiImage: item.icon!)
                                Text(item.emoji)
                                    .font(.title)
                                .foregroundColor(.gray)
                                Text(item.text)
                                    .font(.body)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            }
                            .frame(minWidth: 90, maxWidth: .infinity, maxHeight: 50, alignment: .top)
                            .padding(.top)
                            .padding(.bottom)
                            .foregroundColor(.gray)
                             .background(
                                 RoundedRectangle(cornerRadius: 25)
                                    .fill(Color(.black).opacity(feelingItems[i!].isSelected ? 0.2 : 0.0))
                             )
                             .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                HStack(spacing: 20) {
                    ForEach(feelingItems[5...]) { item in
                        let i = feelingItems.firstIndex(of: item)
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                                let updatedSelect = !item.isSelected
                                let newVal = FeelingItem(id: item.id, text: item.text, icon: item.icon,emoji:item.emoji, isSelected: updatedSelect)
                                feelingItems[i!] = newVal
                                print(feelingItems[i!].isSelected)
                                if feelingItems[i!].isSelected {
                                    selectedFeelings.append(item.text)
                                }else{
                                    let modifiedArray = selectedFeelings.filter { $0 != feelingItems[i!].text }
                                    selectedFeelings = modifiedArray
                                }
                            }
                        }label: {
                            VStack(spacing: 0){
//                                Image(uiImage: item.icon!)
                                Text(item.emoji)
                                    .font(.title)
                                .foregroundColor(.gray)
                                Text(item.text)
                                    .font(.body)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            }
                            .frame(minWidth: 90, maxWidth: .infinity, maxHeight: 50, alignment: .top)
                            .padding(.top)
                            .padding(.bottom)
                            .foregroundColor(.gray)
                             .background(
                                 RoundedRectangle(cornerRadius: 25)
                                    .fill(Color(.black).opacity(feelingItems[i!].isSelected ? 0.2 : 0.0))
                             )
                             .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                HStack{
                ForEach(selectedFeelings, id: \.self) { item in
                        Text(".")
                            .foregroundColor(.clear)
                            .font(.body)
                }
                }
            }
        }
    }
}

struct FeelingsList_Previews: PreviewProvider {
    static var previews: some View {
        FeelingsList(selectedFeelings: .constant(["happy", "shocked"]))
    }
}
