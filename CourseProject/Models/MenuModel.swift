//
//  MenuModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 5.07.22.
//

import UIKit

enum MenuModel: Int, CustomStringConvertible {
    case TarotSpreads
    case Description
    case Preservation
    case Notes
    case Settings
    
    var description: String {
        switch self {
        case .TarotSpreads: return "Tarot Spreads" //"Left \(UserDefaults.standard.integer(forKey: "leftClick"))"
        case .Description: return "Description" //"Right \(UserDefaults.standard.integer(forKey: "rightClick"))"
        case .Preservation: return "Preservation"
        case .Notes: return "Notes"
        case .Settings: return "Settings"
        }
    }
    var image: UIImage {
        switch self {
        case .TarotSpreads: return UIImage(named: "tarotSpreads") ?? UIImage()
        case .Description: return UIImage(named: "description") ?? UIImage()
        case .Preservation: return UIImage(named: "preservation") ?? UIImage()
        case .Notes: return UIImage(named: "notes") ?? UIImage()
        case .Settings: return UIImage(named: "settings") ?? UIImage()
        }
    }
}
