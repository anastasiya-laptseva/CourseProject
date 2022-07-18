//
//  TarotSpreadModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 15.07.22.
//

import UIKit

class TarotSpreadModel {
    struct TarotSpreadJson: Decodable {
        let title : String
        let image: String
    }
    
    let jsonPath = "configTarotSpreads"
    var tarot: [TarotSpreadJson]?
    
    init() {
        guard
          let url = Bundle.main.url(forResource: jsonPath, withExtension: "json"),
          let data = try? Data(contentsOf: url)
        else { return }

        do {
            tarot = try JSONDecoder().decode([TarotSpreadJson].self, from: data)
            
        } catch {
            print(error)
        }
    }
}
