//
//  SettingModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 13.07.22.
//

import UIKit

enum SettingModel: Int, CustomStringConvertible {
    case language
    case topic
    case font
    case notifications
    
    var description: String {
        switch self {
        case .language: return "Language"
        case .topic: return "Topic"
        case .font: return "Font"
        case .notifications: return "Notifications"
        }
    }
}
