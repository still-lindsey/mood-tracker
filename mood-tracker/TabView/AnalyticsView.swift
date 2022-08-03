//
//  AnalyticsView.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import SwiftUI

struct AnalyticsView: View {
    @Binding var entryAdded: Bool
    var body: some View {
        VStack{
            
        }
        .onAppear{
            entryAdded = false
        }
    }
}

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView(entryAdded: .constant(true))
    }
}
