//
//  Bundle.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 16.02.2023.
//

import Foundation

extension Bundle {
    var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? String()
    }
}
