//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by João Vitor on 12/08/25.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    var successResult: ((String) -> Void)?
    var erroResult: ((String) -> Void)?
    
    func doAuth(usernameLogin: String, password: String) {
        Auth.auth().signIn(withEmail: usernameLogin, password: password) { [weak self] authResult, error in
            if let error = error {
                self?.erroResult?("Erro a relizar login")
            } else {
                self?.successResult?(usernameLogin)
            }
        }
    }
}
