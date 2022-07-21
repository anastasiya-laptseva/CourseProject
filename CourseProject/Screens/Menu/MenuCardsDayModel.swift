//
//  MenuCardsDayModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 12.07.22.
//

import UIKit

class MenuCardsDayModel {
    struct MenuCardsJson: Decodable {
        let description: String
        let image: String
    }
    let jsonPath = "configCardsDay"
    var cards: [MenuCardsJson]?
    
    init() {
        guard
          let url = Bundle.main.url(forResource: jsonPath, withExtension: "json"),
          let data = try? Data(contentsOf: url)
        else { return }

        do {
            cards = try JSONDecoder().decode([MenuCardsJson].self, from: data)
            
        } catch {
            print(error)
        }
    }
}
