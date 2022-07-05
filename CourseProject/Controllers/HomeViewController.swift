//
//  HomeViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 3.07.22.
//

import UIKit

protocol HomeViewControllerDelegate {
    func toggleMenu()
    func collectionMenu()
}

class HomeViewController: UIViewController {
    

    @IBOutlet weak var MapLabel: UILabel!
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var MapViewImage: UIImageView!
    @IBOutlet weak var buttonOpenMap: UIButton!
    @IBOutlet weak var buttonMenu: UIButton!
    
    var delegate: HomeViewControllerDelegate?
    
//    var startState: Bool = false
    
//    var blockView = UIImageView()

    var mapView = UIView()
//    var score = UserDefaults.standard.integer(forKey: "score")
//    var leftClick = UserDefaults.standard.integer(forKey: "leftClick")
//    var rightClick = UserDefaults.standard.integer(forKey: "rightClick")
    
//    var blockXConstraint: NSLayoutConstraint!
//    var blockYConstraint: NSLayoutConstraint!
    
    var mapXConstraint: NSLayoutConstraint!
    @IBOutlet weak var mapCenterAnchour: NSLayoutConstraint!
    var mapYConstraint: NSLayoutConstraint!
    
    var mapPosition = [-120.0, 0.0, 120.0]
    var indexPosition = 1
    
    var backgroundXConstraint: NSLayoutConstraint!
    var backgroundYConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let screenWidth = UIScreen.main.bounds.width
//        carPosition = [-screenWidth/4, 0.0, screenWidth/4]
//        createBlockView()
//        createButtons()
//        createPositionCar()
    }
//    func getCarPosition(direction: Int) -> CGFloat {
//        indexPosition += direction
//        if indexPosition < 0 {
//            indexPosition = 0
//        }
//        if indexPosition > mapPosition.count - 1 {
//            indexPosition = mapPosition.count - 1
//        }
//        return mapPosition[indexPosition]
//    }
//    func directionTapped(key: String,direction: Int) -> Bool {
////        if startState == false {
////            return false
////        }
//        var click = UserDefaults.standard.integer(forKey: key)
//        click = click+1
//        UserDefaults.standard.set(click, forKey: key)
//        mapCenterAnchour.constant = getCarPosition(direction: direction)
//        view.setNeedsLayout()
//                    UIView.animate(withDuration: 0.5) {
//                        self.view.layoutIfNeeded()
//                    } completion: { _ in
//                    }
//        print(key)
//        updateScore()
//        return true
//    }
//    @IBAction func buttonLeftTapped(_ sender: Any) {
//        if directionTapped(key: "leftClick", direction: -1) == false {
//            return
//        }
//    }
//    @IBAction func buttonRightTapped(_ sender: Any) {
//        if directionTapped(key: "rightClick", direction: 1) == false {
//            return
//        }
//    }
    @IBAction func buttonMenuTapped(_ sender: Any) {
        //перерисовка лэйбла
//        updateScore()
        delegate?.toggleMenu()
    }
    
    @IBAction func buttonCollectionTapped(_ sender: Any) {
        delegate?.collectionMenu()
    }
    
    @IBAction func buttonOpenMapTapped(_ sender: Any) {
//        startState = true
//        animatedRoad()
    }
    
//    func updateScore() {
//        let countLeft = UserDefaults.standard.integer(forKey: "leftClick")
//        let countRight = UserDefaults.standard.integer(forKey: "rightClick")
//        let score = countLeft + countRight
//
//
//        scoreLabel.text = "\(countLeft)/\(countRight)"
//        scoreLabel2.text = "Score: \(score)"
//    }
    
    func displacePositionCar(shouldMove: Bool) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    override func viewDidAppear(_ animated: Bool) {
//        animatedBlock()
//        updateBlock()
    }
    override func viewWillDisappear(_ animated: Bool) {
//        storyboard?.instantiateInitialViewController(creator: )
    }
    override func didReceiveMemoryWarning() {
//        если приложение съело слишком много памяти
    }
    //создаем обьекты и их позиции
//    func createBlockView() {
//        blockView.isHidden = startState == false
//        blockView.translatesAutoresizingMaskIntoConstraints = false
//        if randomImageBlock() != nil {
//            blockView.image = randomImageBlock()
//                }
//        blockView.contentMode = .scaleAspectFill
//        view.addSubview(blockView)
//        blockXConstraint = randomConstraint()
//        blockYConstraint = blockView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0)
//
//        NSLayoutConstraint.activate([
//            blockView.widthAnchor.constraint(equalToConstant: 70.0),
//            blockView.heightAnchor.constraint(equalToConstant: 70.0),
//            blockXConstraint,
//            blockYConstraint
//        ])
//    }
//
    // Анимация препятствий
//    func animatedBlock() {
//        blockYConstraint.constant = 1000.0
//        view.setNeedsLayout()
//        UIView.animate(withDuration: 5.0, delay: 0.0, options: [.repeat, .curveLinear]) {
//            self.view.layoutIfNeeded()
//        } completion: { _ in
//            self.blockView.removeFromSuperview()
//        }
//    }
    //обновляем препятствие
//    func updateBlock() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.blockView.isHidden = self.startState == false
//            }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
////            self.blockView.isHidden = self.startState == false
//            if self.startState == false {
//                return
//            }
//            let image = self.randomImageBlock()
//            if image != nil {
//                self.blockView.image = image
//            }
//            self.updateBlock()
//        }
//    }
    // функция рандома для картинки препятствия
//    func randomImageBlock() -> UIImage? {
//            let bin = UIImage(named: "bin")
//            let banana = UIImage(named: "banana")
//            let stone = UIImage(named: "stone")
//            let array = [bin, banana, stone]
//            let randomValue = Int.random(in: 0..<array.count)
//            return array[randomValue]
//        }
    // функция рандома для позиции препятствия
//    func randomConstraint() -> NSLayoutConstraint {
//        let firstPosition = blockView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40.0)
//        let secondPosition = blockView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 120.0)
//        let thirdPosition = blockView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 230.0)
//        let array = [firstPosition, secondPosition, thirdPosition]
//        let randomValue = Int.random(in: 0..<array.count)
//        return array[randomValue]
//        }
    
    //Анимация дороги
//    func animatedRoad() {
//        backgroundBottomConstraint.constant = 200.0
//        view.setNeedsLayout()
//        UIImageView.animate(withDuration: 1.0, delay: 0.0, options: [.repeat, .curveLinear]) {
//            self.view.layoutIfNeeded()
//        } completion: { _ in
//        }
//    }
}
