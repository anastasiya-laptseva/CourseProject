//
//  AuthController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 7.07.22.
//

import UIKit
import GoogleSignIn
import FirebaseCore
import FirebaseAuth

class AuthViewController: UIViewController {
    var authModel: AuthModel?

    override func viewDidLoad() {
        super.viewDidLoad()
//         notifications
//        UNUserNotificationCenter.current().requestAuthorization(options: .alert) { result, error in
//            print(result)
//            print(error)
//        }
        let content = UNMutableNotificationContent()
        content.title = "The card of the day is waiting for you!"
        content.subtitle = "See what events await you today!"
        let timeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
        let request = UNNotificationRequest(identifier: "test notification",
                              content: content,
                              trigger: timeTrigger)
        UNUserNotificationCenter.current().add(request) { error in
            print(error)
        }
        // for easy test
//        goToMenu()
    }

    @IBAction func onSignIn(_ sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

            if let error = error {
                showAlert(title: "Авторизация", message: "Не удалось авторизоваться, попробуйте снова")
                return
            }
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                showAlert(title: "Авторизация", message: "Не удалось авторизоваться, попробуйте снова")
                return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                     accessToken: authentication.accessToken)
            authModel = AuthModel(credential: credential)
            goToMenu()
        }
    }

    func goToMenu() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "menuVC")
        self.navigationController?.setViewControllers([vc], animated: true)
    }
}
