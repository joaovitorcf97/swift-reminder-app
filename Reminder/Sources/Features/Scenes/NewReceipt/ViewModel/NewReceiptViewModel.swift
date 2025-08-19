//
//  NewReceiptViewModel.swift
//  Reminder
//
//  Created by João Vitor on 19/08/25.
//

import Foundation

class NewReceiptViewModel {
    func addReceipt(remedy: String, time: String, recurrence: String, takeNow: Bool) {
        DBHelper.shared.insertReceipt(remedy: remedy, time: time, recurrence: recurrence, takeNow: takeNow)
    }
}
