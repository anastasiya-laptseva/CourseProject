//
//  PreservationViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 10.07.22.
//

import UIKit
import CoreData

class SavesViewController: UIViewController {
    let segue = "loadFromSaveSegue"
    
    static let cellIdentifier = "cell"
    
    @IBOutlet var tableView: UITableView!
    
    var saves = [SaveTable]()
    var selectSave: SaveTable?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.cellIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        saves = loadSave()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? FinancialSpreadViewController {
            controller.currentSave = selectSave
        }
    }
}

extension SavesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectSave = saves[indexPath.row]
        self.performSegue(withIdentifier: segue, sender: self)
    }
}

extension SavesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        saves.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier, for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        if let date = saves[indexPath.row].dateField {
            configuration.text = "\(date)"
        }
        cell.contentConfiguration = configuration
        return cell
    }
}
