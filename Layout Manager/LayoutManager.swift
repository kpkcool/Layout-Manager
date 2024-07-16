//
//  LayoutManager.swift
//  Layout Manager
//
//  Created by K Praveen Kumar on 16/07/24.
//

import Foundation

class LayoutManager {
    func createViewModel(from json: [String: Any]) -> CustomViewModel? {
        guard let type = json["type"] as? String else { return nil }
        
        switch type {
        case "banner":
            return BannerViewModel(title: json["title"] as? String ?? "", subtitle: json["title"] as? String ?? "", image: nil)
        case "spacer":
            return SpacerViewModel(height: json["height"] as? CGFloat ?? 0)
        case "delivery":
            return DeliveryViewModel(deliveryTime: json["deliveryTime"] as? String ?? "")
        case "image":
            return ImageViewModel(url: json["url"] as? String ?? "", height: json["height"] as? CGFloat ?? 0)

        default:
            return nil
        }
    }
}
