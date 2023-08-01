//
//  Crypto_App_iOSApp.swift
//  Crypto_App_iOS
//
//  Created by Vasyl Nadtochii on 25.11.2022.
//

import SwiftUI

@main
struct Crypto_App_iOSApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                AppCoordinatorView(coordinator: .init(
                    preferences: PreferencesImpl(),
                    mainCoordinator: MainCoordinator(
                        homeViewModel: HomeViewModelImpl(
                            coinService: CoinServiceImpl(
                                executor: NetworkRequestExecutor()
                            )
                        )
                    ),
                    introViewModel: IntroViewModel(preferences: PreferencesImpl())
                  )
               )
            }
        }
    }
}

