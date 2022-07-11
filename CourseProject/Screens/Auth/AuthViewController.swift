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
        //for easy test
        goToMenu()
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
