//
//  ReminderFlowController.swift
//  Reminder
//
//  Created by João Vitor on 12/08/25.
//

import Foundation
import UIKit

class ReminderFlowController {
    // MARK: - Properties
    private var navigationController: UINavigationController?
    private let viewControllerFactory: ViewControllerFactoryProtocol
    
    // MARK: - Init
    public init() {
        self.viewControllerFactory = ViewControllersFactory()
    }
    
    // MARK: - StartFlow
    func start() -> UINavigationController? {
        let splashViewController = viewControllerFactory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: splashViewController)
        return navigationController
    }
}

// MARK: Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = viewControllerFactory.makeLoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
        
        func navigateToHome() {
            self.navigationController?.dismiss(animated: true)
            let viewController = viewControllerFactory.makeHomeViewController(flowDelegate: self)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

// MARK: Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true)
        let viewController = viewControllerFactory.makeHomeViewController(flowDelegate: self)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: Home
extension ReminderFlowController: HomeFlowDelegate {
    func navigateToRecepes() {
        let recipesViewController = viewControllerFactory.makeRecipesViewController()
        self.navigationController?.pushViewController(recipesViewController, animated: true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func logout() {
        self.navigationController?.popViewController(animated: true)
        self.openLoginBottomSheet()
    }
}
