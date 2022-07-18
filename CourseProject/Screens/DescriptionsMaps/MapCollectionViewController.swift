//
//  MapCollectionViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 17.07.22.
//

import UIKit

class MapCollectionViewController: UICollectionViewController {
    private let segue = "mapDescriptionSegue"
    let mapCards = MapCardsDayModel()
    var numberSelect = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.backgroundView = UIImageView(image: UIImage(named: "background"))
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let descruptionController = segue.destination as? MapDescriptionViewController {
            let key = self.mapCards.cards?[numberSelect].description ?? ""
            let description = self.getLocale(key: key)
            
            descruptionController.descriptionText = getLocale(key: description)
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mapCards.cards?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        numberSelect = indexPath.row
        performSegue(withIdentifier: segue, sender: self)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MapsCollectionViewCell.reuseID, for: indexPath) as! MapsCollectionViewCell
        
        let appLang = UserDefaults.standard.string(forKey: "app_lang") ?? "ru"
        var langKey = "en"
        if(appLang == "ru"){
            langKey = "ru"
        }
        
        let image = getImage(langKey: langKey, numberKey: indexPath.row) ?? UIImage()
        cell.mapImageView?.image = image
        
    
        return cell
    }
    
    func getImage(langKey: String, numberKey: Int) -> UIImage? {
        let imageName = "\(mapCards.cards?[numberKey].image ?? "")_\(langKey)"
        return UIImage(named: imageName)
    }
}
