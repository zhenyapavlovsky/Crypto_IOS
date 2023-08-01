//
//  HomeViewModel.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 06.12.2022.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    enum Result {
        case onSettingsSelected
        case onCoinSelected(coinName: Coins.Coin)
    }
    
    @Published var coins = [Coins.Coin]()
    @Published var output = String()
    @Published var loadingState = false
    
    var onResult: ((Result) -> Void)?
    
    func selectSettings() {
        onResult?(.onSettingsSelected)
    }
    
    func selectCoinItem(coinName: Coins.Coin) {
        onResult?(.onCoinSelected(coinName: coinName))
    }
    
    func getCoins() {}
}

class HomeViewModelImpl: HomeViewModel {
    
    private let coinService: CoinService
    private var cancellables = Set<AnyCancellable>()
    
    init(coinService: CoinService) {
       self.coinService = coinService
    }
    
    override func getCoins() {
        self.loadingState = true
        coinService
          .getCoins()
          .sink { [weak self] completion in
            guard case .failure(let error) = completion else { return }
            self?.output = error.localizedDescription
            self?.loadingState = false
          } receiveValue: { [weak self] coinsValue in
            self?.coins = coinsValue.coins
            self?.loadingState = false
          }
          .store(in: &cancellables)
      }
}
