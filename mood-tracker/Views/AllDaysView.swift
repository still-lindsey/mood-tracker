//
//  AllDaysView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

struct AllDaysView: View {
    @Binding var entryAdded: Bool
    var body: some View {
        VStack{
            
        }
        .onAppear{
            entryAdded = false
        }
    }
}

struct AllDaysView_Previews: PreviewProvider {
    static var previews: some View {
        AllDaysView(entryAdded: .constant(true))
    }
}
