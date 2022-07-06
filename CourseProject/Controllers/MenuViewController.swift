//
//  MenuVievController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 5.07.22.
//

import UIKit

class MenuViewController: UIViewController {

    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        configureTableView()
    }
    @objc func fireTimer() {
        tableView.reloadData()
    }
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.reuseID)
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.isMultipleTouchEnabled = false
//        tableView.selection = .singleSelection
        tableView.separatorStyle = .none
        tableView.rowHeight = 60
        tableView.backgroundColor = .darkGray
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseID) as! MenuTableViewCell
        let menuModel = MenuModel(rawValue: indexPath.row)
        cell.iconImageView.image = menuModel?.image
        cell.myLabel.text = menuModel?.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 3:
            reloadInfo()
            break
        case 4:
            removeAllData()
            break
        default:
            break
        }
    }
    func reloadInfo() {
    }
    
    func removeAllData() {
    }
}
