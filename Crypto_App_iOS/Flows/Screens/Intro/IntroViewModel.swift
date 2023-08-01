//
//  IntroViewModel.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 01.12.2022.
//

import Foundation

class IntroViewModel: ObservableObject {
    
    enum Result {
        case onMainSelected
    }
    
    @Published var titleShown = false
    @Published var buttonShown = false
    
    var onResult: ((Result) -> Void)?
    var preferences: Preferences
    
    init(preferences: Preferences) {
        self.preferences = preferences
    }
    
    func startButton() {
        onResult?(.onMainSelected)
        preferences.introCompleted = true
    }
}
