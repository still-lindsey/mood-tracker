//
//  QuotesView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

struct QuotesView: View {
    @Binding var entryAdded: Bool
    var body: some View {
        VStack{
            
        }
        .onAppear{
            entryAdded = false
        }
    }
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesView(entryAdded: .constant(true))
    }
}
