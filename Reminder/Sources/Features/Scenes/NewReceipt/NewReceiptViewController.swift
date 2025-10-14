//
//  NewReceipt.swift
//  Reminder
//
//  Created by João Vitor on 13/08/25.
//

import Foundation
import UIKit
import Lottie

class NewReceiptViewController: UIViewController {
    let contentView: NewReceiptView
    let viewModel: NewReceiptViewModel
    
    private let successAnimationView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "success")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.isHidden = true
        return animationView
    }()
    
    init(contentView: NewReceiptView, viewModel: NewReceiptViewModel) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActions()
    }
    
    private func setupView() {
        view.backgroundColor = Colors.gray800
        view.addSubview(contentView)
        view.addSubview(successAnimationView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            successAnimationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            successAnimationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            successAnimationView.heightAnchor.constraint(equalTo: 120.0),
//            successAnimationView.widthAnchor.constraint(equalTo: 120.0),
        ])
    }
    
    private func setupActions() {
        contentView.backButton.addTarget(self, action: #selector(backbuttonTapped), for: .touchUpInside)
        contentView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func addButtonTapped() {
        let remedy = contentView.remedyInput.getText()
        let time = contentView.timeInput.getText()
        let recurrence = contentView.recurrenceInput.getText()
        let takeNow = false
        
        viewModel.addReceipt(remedy: remedy, time: time, recurrence: recurrence, takeNow: takeNow)
        playSuccessAnimation()
        print("Receita \(remedy) criada")
    }
    
    @objc
    private func backbuttonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func playSuccessAnimation() {
        successAnimationView.isHidden = false
        successAnimationView.play { [weak self] finished in
            if (finished) {
                self?.successAnimationView.isHidden = true
                self?.clearFieldsAndResetButton()
            }
        }
    }
    
    private func clearFieldsAndResetButton() {
        contentView.remedyInput.textField.text = ""
        contentView.timeInput.textField.text = ""
        contentView.timeInput.textField.text = ""
        contentView.addButton.isEnabled = false
    }
}
