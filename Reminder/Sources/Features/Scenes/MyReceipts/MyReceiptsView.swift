//
//  MyReceiptsView.swift
//  Reminder
//
//  Created by João Vitor on 19/08/25.
//

import Foundation
import UIKit

class MyReceiptsView: UIView {
   weak public var delegate: MyReceiptsViewDelegate?
    
    let headerBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray600
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "arrow.left")
        button.setImage(image, for: .normal)
        button.tintColor = Colors.primaryRedBase
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let addButon: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "add-button")
        button.setImage(image, for: .normal)
        button.tintColor = Colors.primaryRedBase
        button.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Minhas receitas"
        label.font = Typography.heading
        label.textColor = Colors.primaryBlueBase
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Acompanhe seus medicamentos cadastrados e gerencie lembretes"
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contentBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Metrics.medium
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.masksToBounds = true
        view.backgroundColor = Colors.gray800
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(headerBackground)
        headerBackground.addSubview(backButton)
        headerBackground.addSubview(titleLabel)
        headerBackground.addSubview(subTitleLabel)
        headerBackground.addSubview(addButon)
        addSubview(contentBackground)
        contentBackground.addSubview(tableView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerBackground.topAnchor.constraint(equalTo: topAnchor),
            headerBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerBackground.heightAnchor.constraint(equalToConstant: Metrics.backgroundProfileSize),
            
            backButton.leadingAnchor.constraint(equalTo: headerBackground.leadingAnchor, constant: Metrics.medium),
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -Metrics.small),
            backButton.heightAnchor.constraint(equalToConstant: 32),
            backButton.widthAnchor.constraint(equalToConstant: 32),
            
            addButon.trailingAnchor.constraint(equalTo: headerBackground.trailingAnchor, constant: -Metrics.medium),
            addButon.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            addButon.heightAnchor.constraint(equalToConstant: 40),
            addButon.widthAnchor.constraint(equalToConstant: 40),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Metrics.high),
            titleLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.little),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: headerBackground.trailingAnchor, constant: -Metrics.medium),
            
            contentBackground.topAnchor.constraint(equalTo: headerBackground.bottomAnchor, constant: -Metrics.small),
            contentBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: contentBackground.topAnchor, constant: Metrics.medium),
            tableView.leadingAnchor.constraint(equalTo: contentBackground.leadingAnchor, constant: Metrics.medium),
            tableView.trailingAnchor.constraint(equalTo: contentBackground.trailingAnchor, constant: -Metrics.medium),
            tableView.bottomAnchor.constraint(equalTo: contentBackground.bottomAnchor),
        ])
    }
    
    @objc
    private func didTapBackButton() {
        delegate?.didTapBackButton()
    }
    
    @objc
    private func didTapAddButton() {
        delegate?.didTapAddButton()
    }
}


protocol MyReceiptsViewDelegate: AnyObject {
    func didTapBackButton()
    func didTapAddButton()
}
