//
//  CustomAlertViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 7.07.22.
//

import UIKit

extension UIViewController {
    // создание окна
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        //добавляем кнопку в alert
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        alert.view.backgroundColor = .gray
        self.present(alert, animated: true, completion: nil)
    }
}
