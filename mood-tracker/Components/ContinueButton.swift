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
        .padding(.trailing, 50)
        .foregroundColor(.white)
         .background(
             RoundedRectangle(cornerRadius: 25)
                .fill(Color(hue: 0.471, saturation: 0.034, brightness: 0.693))
         )
         .buttonStyle(PlainButtonStyle())
    }
}

struct ContinueButton_Previews: PreviewProvider {
    static var previews: some View {
        ContinueButton( pageNum: .constant(0))
    }
}
