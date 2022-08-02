//
//  CancelButton.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 8/2/22.
//

import SwiftUI

struct CancelButton: View {
    @Binding var hidden: Bool
    var body: some View {
        HStack{
            Button("x"){hidden.toggle()}
                .font(.title)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing)
    }
}

struct CancelButton_Previews: PreviewProvider {
    static var previews: some View {
        CancelButton(hidden: .constant(false))
    }
}
