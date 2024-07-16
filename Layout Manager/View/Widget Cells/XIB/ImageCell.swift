//
//  ImageCell.swift
//  Layout Manager
//
//  Created by K Praveen Kumar on 16/07/24.
//

import UIKit
import SDWebImage

class ImageCell: UICollectionViewCell, CustomViewProtocol {

    @IBOutlet weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with model: CustomViewModel) {
        guard let model = model as? ImageViewModel else { return }
        print(model.url)
        guard let url = URL(string: model.url) else { return }
        myImageView.sd_setImage(with: url)
        self.heightAnchor.constraint(equalToConstant: model.height).isActive = true
        backgroundColor = .green
    }
}
