//
//  CryptoCoordinatorView.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 01.03.2023.
//

import SwiftUI
import SwiftUINavigation

struct AppCoordinatorView: View {
    
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        NavigationView {
            ZStack {
                switch coordinator.route {
                case .intro:
                    IntroView(viewModel: coordinator.introViewModel)
                case .main:
                    MainCoordinatorView(coordinator: coordinator.mainCoordinator)
                case .none:
                    EmptyView()
                }
            }
        }
    }
}
