//
//  ViewControllerFactoryProtocol.swift
//  Reminder
//
//  Created by João Vitor on 12/08/25.
//

import Foundation

protocol ViewControllerFactoryProtocol: AnyObject {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController
    func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController
    func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController
    func makeNewRecipesViewController() -> NewReceiptViewController
    func makeMyReceiptsViewController() -> MyReceiptsViewController
}
