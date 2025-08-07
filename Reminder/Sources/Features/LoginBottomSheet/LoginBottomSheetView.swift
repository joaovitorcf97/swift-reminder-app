//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by João Vitor on 06/08/25.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    private let titleLabel: UILabel = {
        let text = UILabel()
        text.text = "login.welcome.title".localized
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let handleArea: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = Metrics.tiny
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.email.placeholder".localized
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let passwordTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.password.placeholder".localized
        text.borderStyle = .roundedRect
        text.isSecureTextEntry = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("login.button.title".localized, for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.tiny
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        
        addSubview(handleArea)
        addSubview(titleLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            handleArea.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.small),
            handleArea.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            handleArea.widthAnchor.constraint(equalToConstant: 40),
            handleArea.heightAnchor.constraint(equalToConstant: 6),
            
            titleLabel.topAnchor.constraint(equalTo: handleArea.bottomAnchor, constant: Metrics.hugeMedium),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.hugeMedium),
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.hugeMedium),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.hugeMedium),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.hugeMedium),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.hugeMedium),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Metrics.hugeMedium),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.hugeMedium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.hugeMedium),
            loginButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
