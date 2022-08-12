//
//  AllDaysManager.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.
//

import SwiftUI

class AllDaysManager {
    func getAllDays()async throws -> [AllDaysResponseBody]{
        guard let url = URL(string: "https://bloom-app-server.herokuapp.com/days") else {fatalError("Missing URL.")}
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error getting all day.")}
        
        let decodedData = try JSONDecoder().decode([AllDaysResponseBody].self, from: data)

        return decodedData
    }
}

struct AllDaysResponseBody: Codable, Sequence, IteratorProtocol, Equatable, Hashable {
    var day_of_week: String
    var month: String
    var day_id: Int
    var entries: [EntryResponse]
    var quote: String
    var quote_author: String
    var date: String
    var month_id: Int
    
    static func == (lhs: AllDaysResponseBody, rhs: AllDaysResponseBody) -> Bool {
        return lhs.day_id == rhs.day_id
    }
        
    func hash(into hasher: inout Hasher) {
            hasher.combine(day_id)
        }

    mutating func next() -> Int? {
            if day_id == 0 {
                return nil
            } else {
                defer { day_id -= 1 }
                return day_id
            }
        }
    func entryCountPerDay() -> Int{
        var count = 0
        for _ in entries{
            count += 1
        }
        return count
    }
}

struct EntryResponse: Codable, Hashable{
    func hash(into hasher: inout Hasher) {
            hasher.combine(entry_id)
        }

    var activities: [String]
    var emotions: [String]
    var entry_id: Int
    var memo: String
    var title: String
    var mood_score: Double
    var time_stamp: String
}

