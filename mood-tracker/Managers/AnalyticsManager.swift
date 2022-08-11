//
//  AnalyticsManager.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.
//

import SwiftUI

class AnalyticsManager {
    func getAnalytics(monthId: Int)async throws -> AnalyticsResponse {
        guard let url = URL(string: "https://bloom-app-server.herokuapp.com/months/\(monthId)/analytics") else {fatalError("Missing URL.")}
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error getting analytics.")}
        
        let decodedData = try JSONDecoder().decode(AnalyticsResponse.self, from: data)

        return decodedData
    }
}

struct AnalyticsResponse: Codable {
    var days_average_moods: [Double]
    var month_average_mood: Double
    var negative_activities: [String]
    var positive_activities: [String]
    var num_negative_days: Int
    var num_positive_days: Int
    var top_three_activities_freq: [ActivityAndFrequency]
    var top_three_feelings_freq: [FeelingAndFrequency]
    
    struct ActivityAndFrequency: Codable {
        var activity: String
        var frequency: Double
    }
    
    struct FeelingAndFrequency: Codable {
        var feeling: String
        var frequency: Double
    }
}
