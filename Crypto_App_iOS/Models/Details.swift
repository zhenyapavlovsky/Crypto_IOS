//
//  Details.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 29.03.2023.
//

import Foundation

struct Details {

    let currentPrice: Double
    let periodPrices: [PeriodPrices]
    let news: [News]

    struct PeriodPrices: Identifiable {
        let id: String
        let date: String
        let price: Double
    }

    struct News: Identifiable {
        let id: String
        let date: String
        let title: String
        let url: String
    }
}
