//
//  DemoService.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Foundation

public struct DemoService {
    
    public init() {}
    
    public static func performServiceAction(bannerTag: String = "DemoService") -> String {
        return "\n🎁 \(bannerTag) action was performed 🎁\n"
    }
    
}

