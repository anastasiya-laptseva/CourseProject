//
//  MenuViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 7.07.22.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var imageCard: UIImageView!
    @IBOutlet weak var buttonMapOfDay: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var leftMenuConstraint: NSLayoutConstraint!
    
    let leftMenuPositions = [100.0, -50.0]
    var numberPosition = 0
    
    let menuCardsDay = MenuCardsDayModel()
    var numberCardsDay = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonMapOfDay.setTitle(getLocale(key: "buttomMapOfDay"), for: .normal) 
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setCardOfDay()
        
        //TODO: Check card
        numberCardsDay = 0
        
        var langKey = "en"
        if(Locale.current.languageCode == "ru"){
            langKey = "ru"
        }
        let imageName = "\(menuCardsDay.cards?[numberCardsDay].image ?? "")_\(langKey)"
        imageCard.image = UIImage(named: imageName)
    }

    @IBAction func onMenuClick(_ sender: Any) {
        leftMenuConstraint.constant = leftMenuPositions[numberPosition]
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        numberPosition = numberPosition + 1
        if numberPosition > leftMenuPositions.count - 1 {
            numberPosition = 0
        }
    }
    @IBAction func tapChangedMap(_ sender: Any) {
        let key = menuCardsDay.cards?[numberCardsDay].description ?? ""
        let description = getLocale(key: "\(key)_description")
        showAlert(title: "", message: description)
    }
    
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseID) as! MenuTableViewCell
        let menuModel = MenuModel(rawValue: indexPath.row)
        cell.imageMenu.image = menuModel?.image
        cell.nameMenu.text = getLocale(key: menuModel?.description ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let menuModel = MenuModel(rawValue: indexPath.row)
        guard let description = menuModel?.description else { return }
        let segueId = "\(description)Segue"
        self.performSegue(withIdentifier: segueId, sender: self)
    }
    func reloadInfo() {
    }
    
    func removeAllData() {
    }
    
    func setCardOfDay() {
        let keySave = "cardsDayDate"
        let keySaveCurrent = "cardsDayDate_current"
        
        if let date = UserDefaults.standard.object(forKey: keySave) as? Date {
            let df = DateFormatter()
            df.dateFormat = "dd/MM/yyyy"
            
            let current = df.string(from: date)
            let now = df.string(from: Date.now)
            
            if(current.elementsEqual(now)){
                if let number = UserDefaults.standard.object(forKey: keySaveCurrent) as? Int{
                    numberCardsDay = number
                    return
                }
            }
        }
        
        if let count = menuCardsDay.cards?.count {
            numberCardsDay = Int.random(in: 0..<count)
            UserDefaults.standard.set(Date.now, forKey: keySave)
            UserDefaults.standard.set(numberCardsDay, forKey: keySaveCurrent)
        }
    }
}
