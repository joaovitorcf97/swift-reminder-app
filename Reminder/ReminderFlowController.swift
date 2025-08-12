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
    
    // MARK: - Init
    public init() {
        
    }
    
    // MARK: - StartFlow
    func start() -> UINavigationController? {
        let splashViewController = SplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: splashViewController)
        return navigationController
    }
}

// MARK: Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = LoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
    }
}

// MARK: Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
