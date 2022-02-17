//
//  APIServiceWithCH.swift
//  
//
//  Created by Mark Shaw on 2/17/22.
//

import Vapor

#if canImport(FoundationNetworking)
import FoundationNetworking
import Foundation
#endif

public struct APIServiceWithCH {
    
    enum HTTPError: Error {
        case badURL, badResponse, errorDecodingData, invalidURL
    }
    
    public typealias SendCompletionHandler = (HTTPURLResponse) -> ()
    public typealias GetCompletionHandler = ([Event?]?, Error?) -> ()
    
    public static func sendEvent<T: Encodable>(
        _ endpoint: String,
        _ event: T,
        completion: @escaping APIServiceWithCH.SendCompletionHandler) throws {
            guard let url = URL(string: endpoint) else { throw HTTPError.badURL }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try JSONEncoder().encode(event)
            
            URLSession.shared.dataTask(with: request) { _, response, error in
                guard let response = response, error == nil else { return }
                completion((response as! HTTPURLResponse))
            }.resume()
        }
    
    public static func getEvents(
        _ endpoint: String,
        completion: @escaping APIServiceWithCH.GetCompletionHandler) throws {
            guard let url = URL(string: endpoint) else { throw HTTPError.badURL }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                do {
                    let events = try JSONDecoder().decode([Event?].self, from: data)
                    DispatchQueue.main.async { completion(events, nil) }
                } catch {
                    completion(nil, HTTPError.errorDecodingData)
                }
            }.resume()
        }
}

