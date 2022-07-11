//
//  HomeViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 3.07.22.
//

import UIKit

protocol HomeViewControllerDelegate {
    func toggleMenu()
    func collectionMenu()
}

class HomeViewController: UIViewController {

    @IBOutlet weak var mapLabel: UILabel!
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var mapViewImage: UIImageView!
    @IBOutlet weak var buttonOpenMap: UIButton!
    @IBOutlet weak var buttonMenu: UIButton!
    
    var delegate: HomeViewControllerDelegate?
    var mapView = UIView()
    
    var mapXConstraint: NSLayoutConstraint!
    @IBOutlet weak var mapCenterAnchour: NSLayoutConstraint!
    var mapYConstraint: NSLayoutConstraint!
    
    var backgroundXConstraint: NSLayoutConstraint!
    var backgroundYConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func buttonMenuTapped(_ sender: Any) {
        delegate?.toggleMenu()
    }
    
    @IBAction func buttonCollectionTapped(_ sender: Any) {
        delegate?.collectionMenu()
    }
    
    @IBAction func buttonOpenMapTapped(_ sender: Any) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    override func viewWillDisappear(_ animated: Bool) {
    }
    override func didReceiveMemoryWarning() {
//        если приложение съело слишком много памяти
    }
   
}
