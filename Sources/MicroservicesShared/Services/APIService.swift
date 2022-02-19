//
//  APIService.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Vapor

#if canImport(FoundationNetworking)
import FoundationNetworking

#else
public struct APIService {

    public static func sendEvent<T: Encodable>(_ endpoint: String, _ event: T) async throws {

        guard let url = URL(string: endpoint) else { throw HTTPError.badURL }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(event)

        let (_, response) = try await URLSession.shared.data(for: request)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw HTTPError.badResponse }
    }

    public static func getEvents(_ endpoint: String) async throws -> [Event] {
        guard let url = URL(string: endpoint) else { throw HTTPError.badURL }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw HTTPError.badResponse
            }

            do {
                let eventArray = try JSONDecoder().decode([Event].self, from: data)
                return eventArray
            } catch {
                return []
            }
        } catch {
            print("getEvents Error: \(error)")
            return []
        }
    }
}
#endif

