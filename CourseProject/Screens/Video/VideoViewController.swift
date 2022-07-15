//
//  NotesViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 11.07.22.
//

import UIKit
import CoreData
import AVKit

class VideoViewController: UIViewController {
    
    static let cellIdentifier = "cell"
    
    @IBOutlet var tableView: UITableView!
    
    let videoModel = VideoModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .clear
//        cell.backgroundColor = .clear
//        tableView.tableFooterView = UIView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.cellIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}
extension VideoViewController: UITableViewDelegate {
    
}

extension VideoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        videoModel.playlist?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let url = videoModel.playlist?[indexPath.row].url {
            let videoURL = URL(string: url)
            let player = AVPlayer(url: videoURL!)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier, for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "\(videoModel.playlist?[indexPath.row].title ?? "")"
        cell.contentConfiguration = configuration
        
        return cell
    }
}
