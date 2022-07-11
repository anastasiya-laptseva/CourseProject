//
//  ViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 7.07.22.
//

import UIKit

extension UIViewController {
    
    func getLocale(key: String) -> String {
        let locale = NSLocalizedString(key, comment: "")
        return locale
    }
    
}
