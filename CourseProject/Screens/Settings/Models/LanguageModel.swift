//
//  LanguageModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 14.07.22.
//

import UIKit

enum LanguageModel: Int, CustomStringConvertible {
    case en
    case ru
    
    var description: String {
        switch self {
        case .en: return "english"
        case .ru: return "russian"
        }
    }
}
