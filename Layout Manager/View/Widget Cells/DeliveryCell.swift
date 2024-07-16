//
//  DeliveryCell.swift
//  Layout Manager
//
//  Created by K Praveen Kumar on 16/07/24.
//

import UIKit

class DeliveryCell: UICollectionViewCell, CustomViewProtocol {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Subtitle"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        titleLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor)
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor)
    }
    
    func configure(with model: CustomViewModel) {
        guard let model = model as? DeliveryViewModel else { return }
        titleLabel.text = model.deliveryTime
        subtitleLabel.text = model.deliveryTime
        backgroundColor = .gray
    }
}
