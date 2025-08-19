//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by João Vitor on 12/08/25.
//

import Foundation

final class ViewControllersFactory: ViewControllerFactoryProtocol {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController {
        let contentView = SplashView()
        let viewController = SplashViewController(contentView: contentView, flowDelegate: flowDelegate)
        return viewController
    }
    
    func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController {
        let contentView = LoginBottomSheetView()
        let viewController = LoginBottomSheetViewController(contentView: contentView, flowDelegate: flowDelegate)
        return viewController
    }
    
    func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController {
        let contentView = HomeView()
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(contentView: contentView, flowDelegate: flowDelegate, viewModel: viewModel)
        return viewController
    }
    
    func makeNewRecipesViewController() -> NewReceiptViewController {
        let contentView = NewReceiptView()
        let viewModel = NewReceiptViewModel()
        let viewController = NewReceiptViewController(contentView: contentView, viewModel: viewModel)
        return viewController
    }
    
    func makeMyReceiptsViewController() -> MyReceiptsViewController {
        let contentView = MyReceiptsView()
        let viewController = MyReceiptsViewController(contentView: contentView)
        return viewController
    }
}
