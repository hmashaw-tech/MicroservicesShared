//
//  BannerService.swift
//  
//
//  Created by Mark Shaw on 2/9/22.
//

public struct BannerService {
    
    public init() {}
    
    public static func performServiceAction(_ bannerTag: String = "BannerService") -> String {
        return "\n🎁 \(bannerTag) :: action performed 🎁\n"
    }
    
}

