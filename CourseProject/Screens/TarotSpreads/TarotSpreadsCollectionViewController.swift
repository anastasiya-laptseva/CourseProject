//
//  TarotSpreadsViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 15.07.22.
//

import UIKit

class TarotSpreadsCollectionViewController: UICollectionViewController {
    let tarotSpreads = TarotSpreadModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundView = UIImageView(image: UIImage(named: "background"))
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tarotSpreads.tarot?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row < 1 {
            performSegue(withIdentifier: "finansialSegue", sender: self)
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TarotSpreadsCell.reuseID, for: indexPath) as! TarotSpreadsCell
        
        guard let tarot = tarotSpreads.tarot?[indexPath.row] else { return cell }
        
        let image = UIImage(named: "\(tarot.image)_en")
        cell.imageView.image = image
        cell.labelView.text = getLocale(key: tarot.title)
        if indexPath.row > 0 {
            cell.isUserInteractionEnabled = false
        }
        else {
            cell.contentView.backgroundColor = .black
        }
    
        return cell
    }
}
