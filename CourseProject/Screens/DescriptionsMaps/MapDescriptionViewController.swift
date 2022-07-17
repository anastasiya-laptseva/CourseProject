//
//  MapDescriptionViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 17.07.22.
//

import UIKit

class MapDescriptionViewController: UIViewController {
    var descriptionText: String = ""
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = descriptionText
    }
}
