//
//  MyReceiptsViewModel.swift
//  Reminder
//
//  Created by João Vitor on 14/10/25.
//

import Foundation

class MyReceiptsViewModel {
    func fetchData() -> [Medicine] {
        return DBHelper.shared.fetchReceipts()
    }
}
