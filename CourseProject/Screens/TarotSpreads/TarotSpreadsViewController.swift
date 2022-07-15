//
//  TarotSpreadsViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 15.07.22.
//

import UIKit

class TarotSpreadsViewController: UIViewController {
    
    static let cellIdentifier = "cell"
    
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Self.cellIdentifier)
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        layout.estimatedItemSize = CGSize(width: 80.0, height: 40.0)
//        layout.itemSize = CGSize(width: 100.0, height: 50.0)
//        layout.minimumInteritemSpacing = 100.0
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension TarotSpreadsViewController: UICollectionViewDelegate {
    
}
extension TarotSpreadsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.cellIdentifier, for: indexPath)
        var configuration = UIListContentConfiguration.cell()
        let tarotSpreadModel = TarotSpreadModel(rawValue: indexPath.row)
//        configuration.text = "Item \(indexPath.item)"
        configuration.text = getLocale(key: tarotSpreadModel?.description ?? "")
        cell.contentConfiguration = configuration
        return cell
    }
}
