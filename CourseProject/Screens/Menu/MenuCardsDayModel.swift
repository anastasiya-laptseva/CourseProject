//
//  MenuCardsDayModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 12.07.22.
//

import UIKit

class MenuCardsDayModel {
    struct MenuCardsJson: Decodable {
        let description : String
        let image: String
    }
    
    let jsonPath = "configCardsDay"
    var cards: [MenuCardsJson]?
    
    init() {
        guard
          let url = Bundle.main.url(forResource: "configCardsDay", withExtension: "json"),
          let data = try? Data(contentsOf: url)
        else { return }

        do {
            cards = try JSONDecoder().decode([MenuCardsJson].self, from: data)
            
        } catch {
            print(error)
        }
    }
    
    private func getJson() -> String {
        if let filepath = Bundle.main.path(forResource: jsonPath, ofType: "") {
            do {
                let content = try String(contentsOfFile: filepath)
                return content
                
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
        return ""
    }
}
