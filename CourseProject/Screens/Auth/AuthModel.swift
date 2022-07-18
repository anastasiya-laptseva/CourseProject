//
//  AuthModel.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 7.07.22.
//

import UIKit
import GoogleSignIn
import FirebaseCore
import FirebaseAuth

class AuthModel {
    var credential: AuthCredential
    init(credential: AuthCredential) {
        self.credential = credential
    }
}
