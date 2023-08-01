//
//  DetailsDTO.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 29.03.2023.
//

import Foundation
import SwiftUI

struct DetailsDTO: Codable {
    
    let currentPrice: Double
    let periodPrices: [PeriodPricesDTO]
    let news: [NewsDTO]
    
    struct PeriodPricesDTO: Codable {
        let id: String
        let date: String
        let price: Double
    }
    
    struct NewsDTO: Codable {
        let id: String
        let date: String
        let title: String
        let url: String
    }
}

extension DetailsDTO: DomainModelConvertible {
    
    func toDomainModel() -> Details {
        Details(
            currentPrice: self.currentPrice,
            periodPrices: self.periodPrices.map({
                $0.toDomainModel()
            }),
            news: self.news.map({
                $0.toDomainModel()
            })
        )
    }
}
    
extension DetailsDTO.PeriodPricesDTO: DomainModelConvertible {
    
    func toDomainModel() -> Details.PeriodPrices {
        Details.PeriodPrices(
            id: self.id,
            date: self.date,
            price: self.price
        )
    }
}

extension DetailsDTO.NewsDTO: DomainModelConvertible {
    
    func toDomainModel() -> Details.News {
        Details.News(
            id: self.id,
            date: self.date,
            title: self.title,
            url: self.url
        )
    }
}

