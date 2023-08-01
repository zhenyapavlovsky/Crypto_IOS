//
//  GraphComponentModel.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 08.12.2022.
//

import Foundation
import SwiftUI

class GraphViewModel: ObservableObject {
    
    
    @Published var periodPrices = [Details.PeriodPrices]()
    
    var priceInfoViewModels: [PriceInfoViewModel] {
        periodPrices.enumerated().map { (index, priceInfo) in
            return PriceInfoViewModel (
                price: priceInfo.price,
                day: priceInfo.date.convertGraph(time: priceInfo.date)!,
                color: periodPrices.getColor(index: index)
            )
        }
    }
    
    var fullBarHeight: Double = 250
    let maxValue: Double = 100
    
    init(periodPrices: [Details.PeriodPrices]) {
        self.periodPrices = periodPrices
    }
}

