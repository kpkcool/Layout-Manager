//
//  ViewModel.swift
//  Layout Manager
//
//  Created by K Praveen Kumar on 16/07/24.
//

import UIKit

protocol CustomViewProtocol {
    func configure(with model: CustomViewModel)
}

protocol CustomViewModel {
    var type: String { get }
}

struct BannerViewModel: CustomViewModel {
    let type = "banner"
    let title: String
    let subtitle: String
    let image: String?
}

struct SpacerViewModel: CustomViewModel {
    let type: String = "spacer"
    let height: CGFloat
}

struct DeliveryViewModel: CustomViewModel {
    let type: String = "delivery"
    let deliveryTime: String
}

struct ImageViewModel: CustomViewModel {
    let type: String = "image"
    let url: String
    let height: CGFloat
}
