//
//  ViewController.swift
//  Layout Manager
//
//  Created by K Praveen Kumar on 16/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    let layoutManager = LayoutManager()
    var viewModels: [CustomViewModel] = []
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BannerCell.self, forCellWithReuseIdentifier: "BannerCell")
        collectionView.register(SpacerCell.self, forCellWithReuseIdentifier: "SpacerCell")
        collectionView.register(DeliveryCell.self, forCellWithReuseIdentifier: "DeliveryCell")
        
        collectionView.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")

        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        loadJSONData()
        collectionView.reloadData()
    }
}

//MARK: - Fetch JSON
extension ViewController {
    func loadJSONData() {
        guard let path = Bundle.main.path(forResource: "localData", ofType: "json") else {
            print("Failed to find JSON file.")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                for json in jsonArray {
                    if let viewModel = layoutManager.createViewModel(from: json) {
                        viewModels.append(viewModel)
                    }
                }
            }
        } catch {
            print("Failed to load JSON data: \(error.localizedDescription)")
        }
    }
}

//MARK: - CollectionView Methods
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = viewModels[indexPath.item]
        
        switch viewModel.type {
        case "banner":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
            cell.configure(with: viewModel)
            return cell
        case "spacer":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpacerCell", for: indexPath) as! SpacerCell
            cell.configure(with: viewModel)
            return cell
        case "delivery":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DeliveryCell", for: indexPath) as! DeliveryCell
            cell.configure(with: viewModel)
            return cell
        case "image":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
            cell.configure(with: viewModel)
            return cell
        default:
            fatalError("Unknown view model type")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewModel = viewModels[indexPath.item]
        
        switch viewModel.type {
        case "banner":
            return CGSize(width: collectionView.frame.width, height: 60)
        case "spacer":
            let model = viewModel as! SpacerViewModel
            return CGSize(width: collectionView.frame.width, height: model.height)
        case "delivery":
            return CGSize(width: collectionView.frame.width, height: 60)
        case "image":
            let model = viewModel as! ImageViewModel
            return CGSize(width: collectionView.frame.width, height: model.height)
        default:
            return CGSize(width: collectionView.frame.width, height: 60)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

