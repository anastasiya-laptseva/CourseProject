//
//  SettingsViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 11.07.22.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var languageTitle: UILabel!
    @IBOutlet weak var themeTitle: UILabel!
    @IBOutlet weak var languageButton: UIButton!
    @IBOutlet weak var themeButton: UIButton!
    
    var language: LanguageModel = .en
    var theme: ThemeModel = .light
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appLang = UserDefaults.standard.string(forKey: "app_lang") ?? "ru"
        switch(appLang) {
        case "en":
            language = .en
            break
        default:
            language = .ru
        }
        
        getLanguage()
        getTheme()
    }
    
    @IBAction func languageClick(_ sender: Any) {
        if language == .en {
            language = .ru
        } else {
            language = .en
        }
        
        getLanguage()
    }
    
    @IBAction func themeClick(_ sender: Any) {
        if theme == .light {
            theme = .dark
        } else {
            theme = .light
        }
        getTheme()
    }
    
    func getLanguage() {
        switch language {
        case .en:
            Bundle.setLanguage(lang: "en")
            break
        case .ru:
            Bundle.setLanguage(lang: "ru")
            break
        }
        languageButton.setTitle(getLocale(key: language.description), for: .normal)
        languageTitle.text = getLocale(key: SettingModel.language.description)
        themeTitle.text = getLocale(key: SettingModel.theme.description)
        themeButton.setTitle(getLocale(key: theme.description), for: .normal)
    }
    func getTheme() {
        
    }
}

