//
//  Coin.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 15.02.2023.
//

import Foundation
import SwiftUI

struct Coins {
    
    let coins: [Coin]
    
    struct Coin: Identifiable {
        
        let id: String
        let name: String
        let price: Double
        let imageURL: String
    }
}
