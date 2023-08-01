//
//  MainCoordinationViewModel.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 19.02.2023.
//

import Foundation
import SwiftUI

class MainCoordinator: ObservableObject {
    
    enum Route {
        case settings(coordinator: SettingsCoordinator)
        case detail(coordinator: DetailCoordinator)
    }
    
    @Published var route: Route?
    
    var homeViewModel: HomeViewModel
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
        homeViewModel.onResult = {[weak self] result in
            switch result {
            case .onCoinSelected(let coinName):
                self?.routeToDetailView(coin: coinName)
            case .onSettingsSelected:
                self?.routeToSettingsView()
            }
        }
    }
    
    func routeToDetailView(coin: Coins.Coin) {
        let detailCoordinator = DetailCoordinator(
            detailViewModel: DetailViewModelImpl(
                coin: coin,
                detailService: CoinServiceImpl(
                    executor: NetworkRequestExecutor()
                )
            )
        )
        detailCoordinator.onResult = { result in
            switch result {
            case .navigationBack:
                self.route = nil
            }
        }
        route = .detail(coordinator: detailCoordinator)
    }
    
    func routeToSettingsView() {
        let settingsCoordinator = SettingsCoordinator(
            settingsViewModel: SettingsViewModel()
        )
        settingsCoordinator.onResult = { result in
            switch result {
            case .navigationBack:
                self.route = nil
            }
        }
        route = .settings(coordinator: settingsCoordinator)
    }
}
