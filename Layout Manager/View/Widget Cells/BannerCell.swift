//
//  BannerCell.swift
//  Layout Manager
//
//  Created by K Praveen Kumar on 16/07/24.
//

import UIKit

class BannerCell: UICollectionViewCell, CustomViewProtocol {
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let actionButton = UIButton(type: .system)
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        contentView.addSubview(titleLabel)
//        contentView.addSubview(subtitleLabel)
        contentView.addSubview(actionButton)
        contentView.addSubview(imageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
//            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
//            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
//            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            
            actionButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            actionButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
//            actionButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 10),
            actionButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        titleLabel.numberOfLines = 0
        subtitleLabel.numberOfLines = 0
        actionButton.setTitle("Action", for: .normal)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    
    func configure(with model: CustomViewModel) {
        guard let model = model as? BannerViewModel else { return }
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        if let image = model.image {
            imageView.image = UIImage(named: image)
        }
        backgroundColor = .cyan
    }
}
