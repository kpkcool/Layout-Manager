//
//  SpacerCell.swift
//  Layout Manager
//
//  Created by K Praveen Kumar on 16/07/24.
//

import UIKit

class SpacerCell: UICollectionViewCell, CustomViewProtocol {
    func configure(with model: CustomViewModel) {
        guard let model = model as? SpacerViewModel else { return }
        self.heightAnchor.constraint(equalToConstant: model.height).isActive = true
    }
}
