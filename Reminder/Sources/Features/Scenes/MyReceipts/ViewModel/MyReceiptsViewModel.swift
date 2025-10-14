//
//  MyReceiptsViewModel.swift
//  Reminder
//
//  Created by João Vitor on 14/10/25.
//

import Foundation
import UserNotifications

class MyReceiptsViewModel {
    func fetchData() -> [Medicine] {
        return DBHelper.shared.fetchReceipts()
    }
    
    func deleteReceipt(medicine: Medicine) {
        DBHelper.shared.deleteReceipts(id: medicine.id)
        removeNotification(for: medicine.remedy)
    }
    
    
    func removeNotification(for remedy: String) {
        let center = UNUserNotificationCenter.current()
        let identifiers = (0..<6).map { "\(remedy)-\($0)" }
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
        print("Notificação \(remedy) removida com sucesso!")
    }
}
