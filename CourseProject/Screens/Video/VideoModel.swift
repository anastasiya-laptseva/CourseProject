//
//  VideoModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 15.07.22.
//

import UIKit

class VideoModel {
    struct VideoJson: Decodable {
        let title : String
        let url: String
    }
    
    let jsonPath = "configVideo"
    var playlist: [VideoJson]?
    
    init() {
        guard
          let url = Bundle.main.url(forResource: jsonPath, withExtension: "json"),
          let data = try? Data(contentsOf: url)
        else { return }

        do {
            playlist = try JSONDecoder().decode([VideoJson].self, from: data)
            
        } catch {
            print(error)
        }
    }
}
