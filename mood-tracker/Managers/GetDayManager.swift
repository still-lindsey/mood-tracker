//
//  GetDayManager.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/31/22.
//

import Foundation
import SwiftUI

class GetDayManager {
    func getDay(dayId: Int)async throws -> GetDayResponseBody{
        guard let url = URL(string: "http://127.0.0.1:5000/days/\(dayId)") else {fatalError("Missing URL.")}
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error getting day.")}
        
        let decodedData = try JSONDecoder().decode(GetDayResponseBody.self, from: data)
        return decodedData
    }
}

struct GetDayResponseBody: Decodable {
    var date: String
    var day_of_week: String
    var month: String
    var day_id: Int
    var entries: [EntryResponse]
    var quote: String
    var quote_author: String
    var status: String
    
    struct EntryResponse: Decodable {
        var activities: [String]
        var emotions: [String]
        var entry_id: Int
        var memo: String
        var title: String
        var mood_score: Double
        var time_stamp: String
    }
}

