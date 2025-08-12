//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by João Vitor on 12/08/25.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    var successResult: (() -> Void)?
    
    func doAuth(usernameLogin: String, password: String) {
        Auth.auth().signIn(withEmail: usernameLogin, password: password) { [weak self] authResult, error in
            if let error = error {
                
            } else {
                self?.successResult?()
            }
        }
    }
}
