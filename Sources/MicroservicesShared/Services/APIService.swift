//
//  APIService.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Foundation

struct APIService {
    
    enum HTTPError: Error {
        case badURL, badResponse, errorDecodingData, invalidURL
    }
    
    static func sendEvent<T: Encodable>(_ endpoint: String, _ event: T) async throws {
        
        guard let url = URL(string: endpoint) else { throw HTTPError.badURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(event)
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw HTTPError.badResponse }
    }
    
}
