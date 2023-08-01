//
//  CoinService.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 26.02.2023.
//

import Foundation
import SwiftUI
import Combine

protocol CoinService {
    
    func getCoins() -> AnyPublisher<Coins, Error>
    func getDetails(id: String) -> AnyPublisher<Details, Error>
}

final class CoinServiceImpl: CoinService {
    
    let executor: NetworkRequestExecutor
    
    init(executor: NetworkRequestExecutor) {
        self.executor = executor
    }
    
    func getCoins() -> AnyPublisher<Coins, Error> {
        func request() -> AnyPublisher<CoinsDTO, Error> {
            return executor
                .performRequest(
                    path: "/getCoins.php",
                    method: .get
                )
        }
        
        return request()
            .map { coinsDTO in
                coinsDTO.toDomainModel()
            }
            .eraseToAnyPublisher()
    }
    
    func getDetails(id: String) -> AnyPublisher<Details, Error> {
        func request() -> AnyPublisher<DetailsDTO, Error> {
            return executor
                .performRequest(
                    path: "/getDetails.php?id=",
                    method: .get
                )
        }
        
        return request()
            .map { detailsDTO in
                detailsDTO.toDomainModel()
            }
            .eraseToAnyPublisher()
    }
}

