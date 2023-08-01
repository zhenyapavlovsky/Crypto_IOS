//
//  ServiceContainer.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 07.03.2023.
//

import Foundation

class ServiceContainer {
    
    static let shared = ServiceContainer()
    
    lazy var coinService = CoinServiceImpl(executor: NetworkRequestExecutor())
}
