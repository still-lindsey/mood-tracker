//
//  ContinueButton.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 8/2/22.
//

import SwiftUI

struct ContinueButton: View {
    @Binding var pageNum: Int
    var body: some View {
        Button("Continue", action: {
            self.pageNum += 1
            })
        .padding(15)
        .padding(.leading, 50)
        .font(.system(.title2, design: .rounded))
        .padding(.trailing, 50)
        .foregroundStyle(.linearGradient(colors: [Color(hex: "FF9999")!, Color(hex:"FFCCB3")!], startPoint: .leading, endPoint: .trailing))
         .background(
             RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
         )
         .buttonStyle(PlainButtonStyle())
    }
}

struct ContinueButton_Previews: PreviewProvider {
    static var previews: some View {
        ContinueButton( pageNum: .constant(0))
    }
}
