//
//  SettingModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 13.07.22.
//

import UIKit

enum SettingModel: Int, CustomStringConvertible {
    case language
    case theme
    
    var description: String {
        switch self {
        case .language: return "language"
        case .theme: return "theme"
        }
    }
}
