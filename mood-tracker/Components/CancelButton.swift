//
//  CancelButton.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 8/2/22.
//

import SwiftUI

struct CancelButton: View {
    @Binding var pageNum: Int
    @Binding var entryAdded: Bool
    @Binding var cancelled: Bool
    var body: some View {
        HStack{
            Button("x", action: {
                self.pageNum = 4
                self.entryAdded = true
                self.cancelled = true
                })
            .frame(maxWidth: .infinity, maxHeight: 10, alignment: .trailing)
            .font(.title2)
            .padding(.trailing, 30)
            .foregroundColor(.white)
             .buttonStyle(PlainButtonStyle())
             
        }
    }
}

struct CancelButton_Previews: PreviewProvider {
    static var previews: some View {
        CancelButton(pageNum: .constant(4), entryAdded: .constant(true), cancelled: .constant(true))
    }
}
