//
//  PreservationViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 10.07.22.
//

import UIKit

class PreservationViewController: UIViewController {
    
    static let cellIdentifier = "cell"
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.cellIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension PreservationViewController: UITableViewDelegate {
    
}

extension PreservationViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier, for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "Cell \(indexPath.row)"
        cell.contentConfiguration = configuration
        
        return cell
    }
}
