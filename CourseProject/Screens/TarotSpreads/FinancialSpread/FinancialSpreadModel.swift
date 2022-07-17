//
//  FinancialSpreadModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 17.07.22.
//

import UIKit

class FinancialSpreadModel {
    struct FinancialSpreadJson: Decodable {
        let image: String
        let descriptions : [String]
    }
    
    let jsonPath = "configFinancial"
    var cards: [FinancialSpreadJson]?
    
    init() {
        guard
          let url = Bundle.main.url(forResource: jsonPath, withExtension: "json"),
          let data = try? Data(contentsOf: url)
        else { return }

        do {
            cards = try JSONDecoder().decode([FinancialSpreadJson].self, from: data)
            
        } catch {
            print(error)
        }
    }
}
