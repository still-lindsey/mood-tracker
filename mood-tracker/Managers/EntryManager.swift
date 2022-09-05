//
//  EntryManager.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.
//

import SwiftUI
import Foundation

class EntryManager {
    
    func postNewEntry (dayId: Int, moodScore: Double, selectedActivities: [String],
                       selectedFeelings: [String],title: String,memo: String, timeStamp: String) async throws -> NewEntryResponseBody {
        let body: [String:Any] = [
            "title": title,
            "memo": memo,
            "mood_score": moodScore,
            "activities": selectedActivities,
            "emotions": selectedFeelings,
            "time_stamp": timeStamp
            ]
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        guard let url = URL(string: "https://web-production-787a.up.railway.app/days/\(dayId)/entries") else {
            fatalError("Missing URL.")}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData
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
