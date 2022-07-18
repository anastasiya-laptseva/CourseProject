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
    var currentSave: SaveTable?
    var isLoadFromSave = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arraySpreadImages.append(imageView1)
        arraySpreadImages.append(imageView2)
        arraySpreadImages.append(imageView3)
        arraySpreadImages.append(imageView4)
        button.setTitle(getLocale(key: "buttonTarotMake"), for: .normal)
        if currentSave != nil {
            loadFromSave()
            currentSave = nil
        }
    }
    @IBAction func onButtonClick(_ sender: Any) {
        switch step {
        case 0:
            prepareTarot(modelSave: nil)
            button.setTitle(getLocale(key: "buttonTarotWrite"), for: .normal)
            break
        default:
            showDescriptionTarot()
        }
        
        step = 1
    }
    func prepareTarot(modelSave: [FinancialSpreadModel.FinancialSpreadJson]?) {
        button.isUserInteractionEnabled = false
        guard let pick4Elements = financialModel.cards?.choose(arraySpreadImages.count) else { return }
        var model = [FinancialSpreadModel.FinancialSpreadJson]()
        if let modelSave = modelSave {
            // load from save
            model = modelSave
        } else {
            // random
            for element in pick4Elements {
                model.append(element)
            }
            // save to core data
            let jsonEncoder = JSONEncoder()
            do {
                // prepare json
                let jsonData = try jsonEncoder.encode(model)
                let json = String(data: jsonData, encoding: .utf8)
                // prepare date
                let dateFormatterGet = DateFormatter()
                dateFormatterGet.dateFormat = "MM-dd-yyyy HH:mm:ss"
                let date = dateFormatterGet.string(from: Date.now)
                // invoke method coredata
                saveName(date: date, save: json ?? "")
            } catch {
            }
        }
        let arrayTitles = ["financial_title_status",
                           "financial_title_help",
                           "financial_title_aim",
                           "financial_title_status_stability"]
        for index in 0..<model.count {
            let imageName = model[index].image
            let imageView = arraySpreadImages[index]
            imageView.image = getImage(key: imageName)
            animateCardDay(imageView: imageView) { _ in
                self.button.isUserInteractionEnabled = true
            }
            let description = model[index].description
            let localeTitle = getLocale(key: arrayTitles[index])
            let localePoint = getLocale(key: description)
            // Добавление описания
            descriptionString.append("\(localeTitle):")
            descriptionString.append("\n")
            descriptionString.append("\n")
            // Добавление пункта
            descriptionString.append("\(localePoint)")
            descriptionString.append("\n")
            descriptionString.append("\n")
            descriptionString.append("\n")
            descriptionString.append("\n")
        }
    }
    func showDescriptionTarot() {
        performSegue(withIdentifier: descriptionSegue, sender: self)
    }
    func getImage(key: String) -> UIImage {
        let appLang = UserDefaults.standard.string(forKey: "app_lang") ?? "ru"
        var langKey = "en"
        if (appLang == "ru") {
            langKey = "ru"
        }
        return UIImage(named: "\(key)_\(langKey)") ?? UIImage()
    }
    func animateCardDay(imageView: UIImageView, finished: @escaping (Bool) -> Void) {
        UIView.transition(with: imageView,
                          duration: 1.0,
                          options: .transitionFlipFromRight,
                          animations: nil,
                          completion: finished)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let descruptionController = segue.destination as? TarotDescriptionViewController {
            descruptionController.descriptionText = descriptionString
        }
    }
    func loadFromSave() {
        step = 1
        button.setTitle(getLocale(key: "buttonTarotWrite"), for: .normal)
        var model = [FinancialSpreadModel.FinancialSpreadJson]()
        if let json = currentSave?.saveField {
            do {
                let data = Data(json.utf8)
                model = try JSONDecoder().decode([FinancialSpreadModel.FinancialSpreadJson].self, from: data)
            } catch {
            }
        }
        prepareTarot(modelSave: model)
    }
}
