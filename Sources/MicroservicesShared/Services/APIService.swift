//
//  APIService.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Foundation

public struct APIService {
    
    enum HTTPError: Error {
        case badURL, badResponse, errorDecodingData, invalidURL
    }
    
    
    public static func sendEvent<T: Encodable>(_ endpoint: String, _ event: T) async throws {
        
        guard let url = URL(string: endpoint) else { throw HTTPError.badURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(event)
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw HTTPError.badResponse }
    }
    
    
    public static func getEvents(endpoint: String) async throws -> [Event] {
        
        guard let url = URL(string: endpoint) else { throw HTTPError.badURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw HTTPError.badResponse
        }
        
        guard let events = try? JSONDecoder().decode([Event].self, from: data) else {
            throw HTTPError.errorDecodingData
        }
        
        return events
    }
    
}

