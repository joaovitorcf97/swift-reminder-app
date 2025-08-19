//
//  NewReceipt.swift
//  Reminder
//
//  Created by João Vitor on 13/08/25.
//

import Foundation
import UIKit

class NewReceiptViewController: UIViewController {
    let contentView: NewReceiptView
    // let delegate: NewReceiptFlowDelegate
    
    init(contentView: NewReceiptView) {
        self.contentView = contentView
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
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setupActions() {
        contentView.backButton.addTarget(self, action: #selector(backbuttonTapped), for: .touchUpInside)
    }
    
    @objc private func backbuttonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
