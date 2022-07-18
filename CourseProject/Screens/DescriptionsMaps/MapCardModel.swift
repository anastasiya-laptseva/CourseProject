//
//  MapCardModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 17.07.22.
//

import UIKit

class MapCardsDayModel {
    struct MapCardsJson: Decodable {
        let description: String
        let image: String
    }
    
    let jsonPath = "configMapCards"
    var cards: [MapCardsJson]?
    
    init() {
        guard
          let url = Bundle.main.url(forResource: jsonPath, withExtension: "json"),
          let data = try? Data(contentsOf: url)
        else { return }

        do {
            cards = try JSONDecoder().decode([MapCardsJson].self, from: data)
            
        } catch {
            print(error)
        }
    }
}
