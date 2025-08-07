//
//  String+Ext.swift
//  Reminder
//
//  Created by João Vitor on 06/08/25.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
