//
//  EndpointNoPath.swift
//  
//
//  Created by Mark Shaw on 2/27/22.
//

import Vapor

public enum EndpointNoPath {
    case local
    case k8s
    case env
    
    public var info: String {
        if let value = ProcessInfo.processInfo.environment["APP_ENV"] {
            return "APP_ENV=\(value)"
        } else {
            return "APP_ENV from App Coded Value"
        }
    }
    
    public var postsService: String {
        switch self {
        case .local:
            return "http://localhost:4000"
        case .k8s:
            return "http://posts-srv:4000"
        case .env:
            if let value = ProcessInfo.processInfo.environment["APP_ENV"] {
                return "http://\(value):4000"
            } else {
                return "http://posts-srv:4000"
            }
        }
    }
    
    public var commentsService: String {
        switch self {
        case .local:
            return "http://localhost:4001"
        case .k8s:
            return "http://comments-srv:4001"
        case .env:
            if let value = ProcessInfo.processInfo.environment["APP_ENV"] {
                return "http://\(value):4001"
            } else {
                return "http://comments-srv:4001"
            }
        }
    }
    
    public var queryService: String {
        switch self {
        case .local:
            return "http://localhost:4002"
        case .k8s:
            return "http://query-srv:4002"
        case .env:
            if let value = ProcessInfo.processInfo.environment["APP_ENV"] {
                return "http://\(value):4002"
            } else {
                return "http://query-srv:4002"
            }
        }
    }
    
    public var moderationService: String {
        switch self {
        case .local:
            return "http://localhost:4003"
        case .k8s:
            return "http://moderation-srv:4003"
        case .env:
            if let value = ProcessInfo.processInfo.environment["APP_ENV"] {
                return "http://\(value):4003"
            } else {
                return "http://moderation-srv:4003"
            }
        }
    }
    
    public var eventsbusService: String {
        switch self {
        case .local:
            return "http://localhost:4005"
        case .k8s:
            return "http://event-bus-srv:4005"
        case .env:
            if let value = ProcessInfo.processInfo.environment["APP_ENV"] {
                return "http://\(value):4005"
            } else {
                return "http://event-bus-srv:4005"
            }
        }
    }
}

