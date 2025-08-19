//
//  HomeViewController.swift
//  Reminder
//
//  Created by João Vitor on 12/08/25.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    let contentView: HomeView
    let delegate: HomeFlowDelegate
    let viewModel: HomeViewModel
    
    init(contentView: HomeView, flowDelegate: HomeFlowDelegate, viewModel: HomeViewModel) {
        self.contentView = contentView
        self.delegate = flowDelegate
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupActionForNewRecipe()
        setupActionForMyReceipts()
        setupNavigationBar()
        checkForExistingData()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        let logoutbuttom = UIBarButtonItem(
            image: UIImage(named: "log-out-icon"),
            style: .plain,
            target: self,
            action: #selector(logoutAction),
        )
        logoutbuttom.tintColor = Colors.primaryRedBase
        navigationItem.rightBarButtonItem = logoutbuttom
    }
    
    private func setup() {
        view.addSubview(contentView)
        self.view.backgroundColor = Colors.gray600
        contentView.delegate = self
        buildHierarchy()
    }
    
    private func buildHierarchy() {
        setupContentToBounds(contentView: contentView)
    }
    
    private func setupActionForNewRecipe() {
        contentView.newRecipeButton.tapAction = { [weak self] in
            self?.didTapNewRecipe()
        }
    }
    
    private func setupActionForMyReceipts() {
        contentView.myPrescriptionButton.tapAction = { [weak self] in
            self?.didTapMyReceipts()
        }
    }
    
    @objc
    private func logoutAction() {
        UserDefaultsManager.removeUser()
        self.delegate.logout()
    }
    
    private func checkForExistingData() {
        if let user = UserDefaultsManager.loadUser() {
            contentView.nameTextField.text = UserDefaultsManager.loadUserName()
        }
        
        if let savedImage = UserDefaultsManager.loadProfileImage() {
            contentView.profileImage.image = savedImage
        }
    }
}

extension HomeViewController: HomeViewDelegate {
    func didTapProfileImage() {
        selectProfileImage()
    }
    
    func didTapNewRecipe() {
        delegate.navigateToRecepes()
    }
    
    func didTapMyReceipts() {
        delegate.navigateToMyReceipts()
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func selectProfileImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            contentView.profileImage.image = editedImage
            UserDefaultsManager.saveProfileImageI(image: editedImage)
        } else if let originalImage = info[.originalImage] as? UIImage {
            contentView.profileImage.image = originalImage
            UserDefaultsManager.saveProfileImageI(image: originalImage)
        }
        
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
