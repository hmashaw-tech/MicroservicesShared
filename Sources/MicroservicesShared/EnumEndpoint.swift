//
//  File.swift
//  
//
//  Created by Mark Shaw on 2/25/22.
//

import Vapor

public enum EndPoint {
    case local
    case k8s
    case env
    
    public var printMe: String {
        if let value = ProcessInfo.processInfo.environment["APP_ENV"] {
            return "APP_ENV=\(value)"
        } else {
            return "APP_ENV matching .k8s"
        }
    }
    
    public var postsService: String {
        switch self {
        case .local:
            return "http://localhost:4000/events"
        case .k8s:
            return "http://posts-srv:4000/events"
        case .env:
            if let value = ProcessInfo.processInfo.environment["APP_ENV"] {
                return "\(value):4000/events"
            } else {
                return "http://posts-srv:4000/events"
            }
        }
    }
    
    public var commentsService: String {
        switch self {
        case .local:
            return "http://localhost:4001/events"
        case .k8s:
            return "http://comments-srv:4001/events"
        case .env:
            if let value = ProcessInfo.processInfo.environment["APP_ENV"] {
                return "\(value):4001/events"
            } else {
                return "http://comments-srv:4001/events"
            }
        }
    }
    
    public var queryService: String {
        switch self {
        case .local:
            return "http://localhost:4002/events"
        case .k8s:
            return "http://query-srv:4002/events"
        case .env:
            if let value = ProcessInfo.processInfo.environment["APP_ENV"] {
                return "\(value):4002/events"
            } else {
                return "http://query-srv:4002/events"
            }
        }
    }
    
    public var moderationService: String {
        switch self {
        case .local:
            return "http://localhost:4003/events"
        case .k8s:
            return "http://moderation-srv:4003/events"
        case .env:
            if let value = ProcessInfo.processInfo.environment["APP_ENV"] {
                return "\(value):4003/events"
            } else {
                return "http://moderation-srv:4003/events"
            }
        }
    }
    
    public var eventsbusService: String {
        switch self {
        case .local:
            return "http://localhost:4005/events"
        case .k8s:
            return "http://event-bus-srv:4005/events"
        case .env:
            if let value = ProcessInfo.processInfo.environment["APP_ENV"] {
                return "\(value):4005/events"
            } else {
                return "http://event-bus-srv:4005/events"
            }
        }
    }
}

