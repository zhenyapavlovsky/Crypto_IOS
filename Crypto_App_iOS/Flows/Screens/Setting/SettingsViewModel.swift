//
//  SettingsViewModel.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 16.02.2023.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    @Published var isOn = false
    
    enum Result {
        case navigationBack
    }
    
    var onResult: ((Result) -> Void)?
    
    func navigationBack() {
        onResult?(.navigationBack)
    }
}
