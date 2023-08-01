//
//  CryptoCoordinator.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 01.03.2023.
//

import Foundation
import SwiftUI

class AppCoordinator: ObservableObject {

    enum Route {
        case main
        case intro
    }

    @Published var route: Route?

    var mainCoordinator: MainCoordinator
    var introViewModel: IntroViewModel

    init(preferences: Preferences,
         mainCoordinator: MainCoordinator,
         introViewModel: IntroViewModel) {
        self.mainCoordinator = mainCoordinator
        self.introViewModel = introViewModel
        introViewModel.onResult = { [weak self] result in
            switch result {
            case .onMainSelected:
                self?.route = .main
            }
        }
        if preferences.introCompleted {
            route = .main
        } else {
            route = .intro
        }
    }
}

