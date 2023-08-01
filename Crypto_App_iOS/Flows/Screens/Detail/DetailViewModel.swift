//
//  DetailViewModel.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 15.02.2023.
//

import Foundation
import SwiftUI
import Combine

class DetailViewModel: ObservableObject {
    
    enum Result {
        case navigationBack
    }
    
    @Published var news = [Details.News]()
    @Published var periodPrices = [Details.PeriodPrices]()
    @Published var customError = false
    @Published var loadingState = false
    @Published var output = String()
    
    var onResult: ((Result) -> Void)?
    var coin: Coins.Coin
    let graphViewModel: GraphViewModel
    let coinService: CoinService
    let formatter = DateFormatter()
    
    init(coin: Coins.Coin, detailService: CoinService) {
        self.coin = coin
        self.coinService = detailService
        self.graphViewModel = GraphViewModel(periodPrices: [])
    }
    
    func navigationBack() {
        onResult?(.navigationBack)
    }
    
    func openURL(url: String) {
        guard let url = URL(string: url) else { return }
        UIApplication.shared.open(url)
    }
}

class DetailViewModelImpl: DetailViewModel {
    
    private var cancellables = Set<AnyCancellable>()
    
    func getDetails() {
        self.loadingState = true
        coinService
            .getDetails(id: coin.id)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                self?.output = error.localizedDescription
                self?.loadingState = false
            } receiveValue: { [weak self] detailValue in
                self?.news = detailValue.news
                self?.graphViewModel.periodPrices = detailValue.periodPrices
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self?.loadingState = false
                }
            }
            .store(in: &cancellables)
    }
}

