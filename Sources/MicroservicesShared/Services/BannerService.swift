//
//  BannerService.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

import Vapor

public struct BannerService {
    
    public init() {}
    
    public static func performServiceAction(_ bannerTag: String = "BannerService") -> String {
        return "\nš \(bannerTag) :: action performed š\n"
    }
    
}

