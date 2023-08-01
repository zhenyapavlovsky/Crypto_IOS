//
//  DetailCoordinationViewModel.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 19.02.2023.
//

import Foundation
import SwiftUINavigation

class DetailCoordinator: ObservableObject {
    
    enum Result {
        case navigationBack
    }
    
    var onResult: ((Result) -> Void)?
    var detailViewModel: DetailViewModelImpl
    
    init(detailViewModel: DetailViewModelImpl) {
        self.detailViewModel = detailViewModel
        detailViewModel.onResult = { [weak self] result in
            switch result {
            case .navigationBack:
                self?.onResult?(.navigationBack)
            }
        }
    }
}
