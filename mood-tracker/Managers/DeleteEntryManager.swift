//
//  DeleteEntryManager.swift
//  mood_tracker
//
//  Created by Lindsey M Still on 8/12/22.
//

import SwiftUI
import Foundation

class DeleteEntryManager {
    
    func deleteEntry (entryId: Int) async throws -> DeleteEntryResponseBody {
        guard let url = URL(string: "https://bloom-app-server.herokuapp.com/entries/\(entryId)") else {
            fatalError("Missing URL.")}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?
            .statusCode == 200 else {
            fatalError("Error deleting entry.")}
        let decodedData = try JSONDecoder()
            .decode(DeleteEntryResponseBody.self, from: data)
        return decodedData
    }
}

struct DeleteEntryResponseBody: Decodable {
    var details: String
}
