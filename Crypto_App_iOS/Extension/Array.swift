//
//  Array.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 26.05.2023.
//

import Foundation
import SwiftUI

extension Array where Element == Details.PeriodPrices {
    func getColor(index: Int) -> Color {
        guard index > 0 else {
            return Color.emerald
        }
        
        let prev = self[index - 1].price
        let current = self[index].price
        return (current >= prev) ? Color.emerald: Color.tomato
    }
}
