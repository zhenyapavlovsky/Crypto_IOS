//
//  SettingCoordinationViewModel.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 19.02.2023.
//

import Foundation
import SwiftUINavigation

class SettingsCoordinator: ObservableObject {
    
    enum Result {
        case navigationBack
    }
    
    var onResult: ((Result) -> Void)?
    var settingsViewModel: SettingsViewModel
    
    init(settingsViewModel: SettingsViewModel) {
        self.settingsViewModel = settingsViewModel
        settingsViewModel.onResult = { [weak self] result in
            switch result {
            case .navigationBack:
                self?.onResult?(.navigationBack)
            }
        }
    }
}


