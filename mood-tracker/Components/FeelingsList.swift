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
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                                selectedFeelings.append(item.text)
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
                                    .fill(Color(.clear))
                             )
                             .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                HStack(spacing: 20) {
                    ForEach(feelingItems[5...]) { item in
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                                selectedFeelings.append(item.text)
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
                                    .fill(Color(.clear))
                             )
                             .buttonStyle(PlainButtonStyle())
                        }
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
