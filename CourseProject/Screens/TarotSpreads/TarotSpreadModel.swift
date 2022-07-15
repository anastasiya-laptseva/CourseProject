//
//  TarotSpreadModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 15.07.22.
//

import UIKit

enum TarotSpreadModel: Int, CustomStringConvertible {
    case onEveryDay
    case lovely
    case situation
    case healthy
    case financial
    case personalGrowth
    case choice
    
    var description: String {
        switch self {
        case .onEveryDay: return "onEveryDaySpread"
        case .lovely: return "lovelySpread"
        case .situation: return "situationSpread"
        case .healthy: return "healthySpread"
        case .financial: return "financialSpread"
        case .personalGrowth: return "personalGrowthSpread"
        case .choice: return "choiceSpread"
        }
    }
}
