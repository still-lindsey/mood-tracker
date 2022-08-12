//
//  CancelButton.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 8/2/22.
//

import SwiftUI

struct CancelButton: View {
    @Binding var selectedTab: MenuTabs
    
    var body: some View {
        HStack{
            Button {
                self.selectedTab = .first
            }label : {
                Image(systemName: "x.circle")
                    .font(.title3)
                    .frame(maxWidth: .infinity, maxHeight: 10, alignment: .trailing)
            }
            .frame(maxWidth: .infinity, maxHeight: 10, alignment: .trailing)
            .font(.system(.title2, design: .rounded))
            .padding(.trailing, 20)
            .padding(.top, 20)
            .foregroundColor(.white)
             .buttonStyle(PlainButtonStyle())
             
        }
    }
}

struct CancelButton_Previews: PreviewProvider {
    static var previews: some View {
        CancelButton(selectedTab: .constant(.first))
    }
}
