//
//  MenuViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 7.07.22.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var debugNextButton: UIButton!
    
    @IBOutlet weak var imageCard: UIImageView!
    @IBOutlet weak var buttonMapOfDay: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var leftMenuConstraint: NSLayoutConstraint!
    
    let leftMenuPositions = [100.0, -50.0]
    var numberPosition = 0
    
    let menuCardsDay = MenuCardsDayModel()
    var numberCardsDay = 0
    var isOpenCard: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // change buttonMap with key
        buttonMapOfDay.setTitle(getLocale(key: "buttomMapOfDay"), for: .normal)
        tableView.dataSource = self
        tableView.delegate = self
        
        setCardOfDay()
//        debugNextClick(self)
        // TODO: Check card
        // numberCardsDay = 1
        // setupImage()
    }
    override func viewWillAppear(_ animated: Bool) {
        buttonMapOfDay.setTitle(getLocale(key: "buttomMapOfDay"), for: .normal)
        if isOpenCard {
            setupImage()
        }
        tableView.reloadData()
    }

    @IBAction func onMenuClick(_ sender: Any) {
        leftMenuConstraint.constant = leftMenuPositions[numberPosition]
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        numberPosition += 1
        if numberPosition > leftMenuPositions.count - 1 {
            numberPosition = 0
        }
    }
    @IBAction func tapChangedMap(_ sender: Any) {
        buttonMapOfDay.isUserInteractionEnabled = false
        if !isOpenCard {
            setupImage()
            animateCardDay {_ in
                self.showDescriptionDay()
                self.buttonMapOfDay.isUserInteractionEnabled = true
            }
        } else {
            showDescriptionDay()
            buttonMapOfDay.isUserInteractionEnabled = true
        }
        isOpenCard = true
    }
    // MARK: Autotesting
    @IBAction func debugNextClick(_ sender: Any) {
        print("----------Autotest: Begin Image and Description Test---------- ")
        guard let cards = menuCardsDay.cards else {
            print("Autotest: No array")
            return
        }
        for number in 0..<cards.count {
            let currentCard = cards[number]
            if getImage(langKey: "en", numberKey: number) == nil {
                print("Autotest: EN No image \(currentCard.image)")
            }
            if getImage(langKey: "ru", numberKey: number) == nil {
                print("Autotest: RU No image \(currentCard.image)")
            }
            if getLocale(key: currentCard.description).isEmpty {
                print("Autotest: No locale \(currentCard.description)")
            }
        }
        print("----------Autotest: End Image and Description Test---------- ")
    }
    // MARK: Autotesting
    @IBAction func tikTokTap(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://tiktok.com/@angel.daemon.taro")!)
    }
    @IBAction func youtubeTap(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://youtube.com/channel/UCIukCEupRBzhdsOTa7RLdMA")!)
    }
    @IBAction func zenTap(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://zen.yandex.ru/profile/editor/id/62beeb66396f275a086435f2")!)
    }
    @IBAction func facebookTap(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.facebook.com/profile.php?id=100082897029310")!)
    }
    @IBAction func instagramTap(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://instagram.com/_angel_daemon_taro_?igshid=YmMyMTA2M2Y=")!)
    }
    @IBAction func telegramTap(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://t.me/anlel_daemon_taro")!)
    }
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseID) as! MenuTableViewCell
        let menuModel = MenuModel(rawValue: indexPath.row)
        cell.backgroundColor = .gray
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
    func getImage(langKey: String, numberKey: Int) -> UIImage? {
        let imageName = "\(menuCardsDay.cards?[numberKey].image ?? "")_\(langKey)"
        return UIImage(named: imageName)
    }
    func setupImage() {
        let appLang = UserDefaults.standard.string(forKey: "app_lang") ?? "ru"
        var langKey = "en"
        if (appLang == "ru") {
            langKey = "ru"
        }
        imageCard.image = getImage(langKey: langKey, numberKey: numberCardsDay)
    }
    func animateCardDay(finished: @escaping (Bool) -> Void) {
        UIView.transition(with: imageCard,
                          duration: 1.0,
                          options: .transitionFlipFromRight,
                          animations: nil,
                          completion: finished)
    }
    func showDescriptionDay() {
        let key = self.menuCardsDay.cards?[self.numberCardsDay].description ?? ""
        let description = self.getLocale(key: key)
        self.showAlert(title: "", message: description)
    }
    func setCardOfDay() {
        let keySave = "cardsDayDate"
        let keySaveCurrent = "cardsDayDate_current"
        if let date = UserDefaults.standard.object(forKey: keySave) as? Date {
            let df = DateFormatter()
            df.dateFormat = "dd/MM/yyyy"
            let current = df.string(from: date)
            let now = df.string(from: Date.now)
            if(current.elementsEqual(now)) {
                if let number = UserDefaults.standard.object(forKey: keySaveCurrent) as? Int {
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
