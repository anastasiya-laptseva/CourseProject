//
//  MenuModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 5.07.22.
//

import UIKit

enum MenuModel: Int, CustomStringConvertible {
    case tarotSpreads
    case description
    case preservation
    case notes
    case settings
    
    var description: String {
        switch self {
        case .tarotSpreads: return "tarotSpreadsMenu"
        case .description: return "descriptionMenu"
        case .preservation: return "preservationMenu"
        case .notes: return "notesMenu"
        case .settings: return "settingsMenu"
        }
    }
    var image: UIImage {
        switch self {
        case .tarotSpreads: return UIImage(named: "tarotSpreads") ?? UIImage()
        case .description: return UIImage(named: "description") ?? UIImage()
        case .preservation: return UIImage(named: "preservation") ?? UIImage()
        case .notes: return UIImage(named: "notes") ?? UIImage()
        case .settings: return UIImage(named: "settings") ?? UIImage()
        }
    }
}
