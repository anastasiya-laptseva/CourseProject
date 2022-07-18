//
//  MapsCollectionViewCell.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 17.07.22.
//

import UIKit

class MapsCollectionViewCell: UICollectionViewCell {
    static let reuseID = "mapCell"
    @IBOutlet weak var mapImageView: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
