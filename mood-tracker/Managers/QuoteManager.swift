//
//  QuoteManager.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.
//

import SwiftUI

import Foundation
import SwiftUI

class GetRandomQuoteManager {
    func getRandomQuote()async throws -> GetRandomQuoteResponseBody{
        guard let url = URL(string: "https://web-production-787a.up.railway.app/quotes") else {fatalError("Missing URL.")}
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error getting random quote.")}
        
        let decodedData = try JSONDecoder().decode(GetRandomQuoteResponseBody.self, from: data)
        return decodedData
    }
}

struct GetRandomQuoteResponseBody: Codable {
    var q: String
    var a: String
    var h: String

}

