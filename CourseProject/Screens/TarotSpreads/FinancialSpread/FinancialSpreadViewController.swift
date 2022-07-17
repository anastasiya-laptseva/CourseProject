//
//  FinancialSpreadViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 16.07.22.
//

import UIKit

class FinancialSpreadViewController: UIViewController {
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    var arraySpreadImages = [UIImageView]()
    
    let financialModel = FinancialSpreadModel()
    
    var step = 0
    
    private let descriptionSegue = "tarotDescriptionSegue"
    private var descriptionString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arraySpreadImages.append(imageView1)
        arraySpreadImages.append(imageView2)
        arraySpreadImages.append(imageView3)
        arraySpreadImages.append(imageView4)
        button.setTitle(getLocale(key: "buttonTarotMake"), for: .normal)
    }
    
    @IBAction func onButtonClick(_ sender: Any) {
        switch step {
        case 0:
            prepareTarot()
            button.setTitle(getLocale(key: "buttonTarotWrite"), for: .normal)
            break
        default:
            showDescriptionTarot()
        }
        
        step = 1
    }
    
    func prepareTarot() {
        button.isUserInteractionEnabled = false
        guard let pick4Elements = financialModel.cards?.choose(arraySpreadImages.count) else { return }
        
        for index in 0..<pick4Elements.count {
            let imageName = pick4Elements[index].image
            
            let imageView = arraySpreadImages[index]
            imageView.image = getImage(key: imageName)
            animateCardDay(imageView: imageView) { _ in
                self.button.isUserInteractionEnabled = true
            }
            
            let description = pick4Elements[index].description
            let locale = getLocale(key: description)
            descriptionString.append("\(index+1). \(locale)")
            descriptionString.append("\n")
        }
    }
    
    func showDescriptionTarot() {
        performSegue(withIdentifier: descriptionSegue, sender: self)
    }
    
    func getImage(key: String) -> UIImage{
        let appLang = UserDefaults.standard.string(forKey: "app_lang") ?? "ru"
        var langKey = "en"
        if(appLang == "ru"){
            langKey = "ru"
        }
        
        return UIImage(named: "\(key)_\(langKey)") ?? UIImage()
    }
    
    func animateCardDay(imageView: UIImageView, finished: @escaping (Bool) -> Void) {
        UIView.transition(with: imageView, duration: 1.0, options: .transitionFlipFromRight, animations: nil, completion: finished)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let descruptionController = segue.destination as? TarotDescriptionViewController {
            descruptionController.descriptionText = descriptionString
        }
    }
}
