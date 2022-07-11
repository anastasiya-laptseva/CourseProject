//
//  ContainerViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 5.07.22.
//

import UIKit

class ContainerViewController: UIViewController, HomeViewControllerDelegate {
    
    var homeController: HomeViewController!
    var menuViewController: UIViewController!
    var collectionMenuViewController: UIViewController!
    var isMove = false
    var isMoveCollection = false

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeViewController()
    }
    
    func configureHomeViewController() {
        view.backgroundColor = .white

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "homeVC") as? HomeViewController
        guard let controller = controller else { return }

        homeController = controller
        homeController.delegate = self
        view.addSubview(homeController.view)
        addChild(homeController)
    }
    
    func configureMenuViewController() {
        if menuViewController == nil {
            menuViewController = MenuViewController()
            collectionMenuViewController?.view.removeFromSuperview()
            view.insertSubview(menuViewController.view, at: 0)
            addChild(menuViewController)
            print("добавил mainviewcontroller")
        }
    }
    func configureCollectionMenuViewController() {
        if collectionMenuViewController == nil {
            collectionMenuViewController = MapsCollectionViewController()
            menuViewController?.view.removeFromSuperview()
            view.insertSubview(collectionMenuViewController.view, at: 0)
            addChild(collectionMenuViewController)
            print("добавил mainviewcontroller")
        }
    }
    func showMenuViewController(shouldMove: Bool) {
        if shouldMove {
            //показываем меню
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut) {
                self.homeController.view.frame.origin.x = self.homeController.view.frame.width - 140
            } completion: { (finished) in
            }
        } else {
            //скрываем меню
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut) {
                self.homeController.view.frame.origin.x = 0
            } completion: { (finished) in
            }
        }
    }
    func showCollectionViewController(shouldMove: Bool) {
        if shouldMove {
            //показываем меню
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut) {
                self.homeController.view.frame.origin.x =  -self.homeController.view.frame.width + 140
            } completion: { (finished) in
            }
        } else {
            //скрываем меню
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut) {
                self.homeController.view.frame.origin.x = 0
            } completion: { (finished) in
            }
        }
    }
    
//    MARK: HomeViewControllerDelegate
    func toggleMenu() {
        configureMenuViewController()
        isMove = !isMove
        showMenuViewController(shouldMove: isMove)
    }
    
    func collectionMenu() {
        configureCollectionMenuViewController()
        isMoveCollection = !isMoveCollection
        showCollectionViewController(shouldMove: isMoveCollection)
    }
}

