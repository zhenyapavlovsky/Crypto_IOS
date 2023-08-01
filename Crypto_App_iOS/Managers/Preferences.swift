//
//  UserDefaultsManager.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 01.03.2023.
//

import Foundation

protocol Preferences {
    var introCompleted: Bool { get set }
}

class PreferencesImpl: Preferences {
    private let introShowText = "intro_is_show"
    var introCompleted: Bool {
        get {
            UserDefaults.standard.bool(forKey: introShowText)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: introShowText)
        }
    }
}
