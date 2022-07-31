//
//  EntryManager.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.
//

import SwiftUI
import Foundation

class EntryManager {
    func postNewEntry (dayId: Int) async throws -> NewEntryResponseBody {
        guard let url = URL(string: "http://127.0.0.1:5000/days/\(dayId)") else {
            fatalError("Missing URL.")}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?
            .statusCode == 201 else {
            fatalError("Error creating entry.")}
        let decodedData = try JSONDecoder()
            .decode(NewEntryResponseBody.self, from: data)
        return decodedData
    }
}

struct NewEntryResponseBody: Decodable {
    var title: String
    var memo: String
    var time_stamp: String
    var entry_id: Int
    var mood_score: Double
    var activities: [String]
    var emotions: [String]
}
