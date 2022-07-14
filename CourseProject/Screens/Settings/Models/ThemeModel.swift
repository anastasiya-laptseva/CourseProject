//
//  ThemeModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 14.07.22.
//

import UIKit

enum ThemeModel: Int, CustomStringConvertible {
    case light
    case dark
    
    var description: String {
        switch self {
        case .light: return "light"
        case .dark: return "dark"
        }
    }
}
