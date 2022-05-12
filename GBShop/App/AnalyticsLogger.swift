//
//  AnalyticsLogger.swift
//  GBShop
//
//  Created by LACKY on 12.05.2022.
//

import Foundation
import Firebase

class AnalyticsLogger {
    class func logEvent(name: String, key: String, value: String) {
        Analytics.logEvent(name, parameters: [key: value])
    }
}
