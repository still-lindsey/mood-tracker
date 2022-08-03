//
//  DayManager.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.
//

import SwiftUI
import Foundation

class DayManager {
    func postNewDay() async throws -> NewDayResponseBody{
        guard let url = URL(string: "http://127.0.0.1:5000/days") else {fatalError("Missing URL.")}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 201 else {fatalError("Error creating day.")}
        
        let decodedData = try JSONDecoder().decode(NewDayResponseBody.self, from: data)
        return decodedData
    }
}

struct NewDayResponseBody: Decodable {
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

//struct Landmark: Codable

//enum CodingKeys: String, CodingKey {
//    case date
//    case dayOfWeek = "day_of_week"
//    case month
//    case dayId
//    case entries
//    case quote
//    case quoteAuthor = "quote_author"
//    case status
//}
