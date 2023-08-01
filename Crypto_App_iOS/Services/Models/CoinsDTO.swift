//
//  CoinsDTO.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 27.03.2023.
//

import Foundation
import SwiftUI

struct CoinsDTO: Codable {
    
    let coins: [CoinDTO]
    struct CoinDTO: Codable {
        
        let id: String
        let name: String
        let price: Double
        let imageURL: String
    }
}

extension CoinsDTO: DomainModelConvertible {
    
    func toDomainModel() -> Coins {
        Coins(coins: self.coins.map({
            $0.toDomainModel()
        }))
    }
}
            
extension CoinsDTO.CoinDTO: DomainModelConvertible {
    
    func toDomainModel() -> Coins.Coin {
        Coins.Coin(
            id: self.id,
            name: self.name,
            price: self.price,
            imageURL: self.imageURL
        )
    }
}
