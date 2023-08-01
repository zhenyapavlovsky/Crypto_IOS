//
//  MainCoordinationView.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 19.02.2023.
//

import SwiftUI
import SwiftUINavigation

struct MainCoordinatorView: View {
    
    @ObservedObject var coordinator: MainCoordinator
    
    var body: some View {
        NavigationView {
            ZStack {
                HomeView(viewModel: coordinator.homeViewModel)
                
                NavigationLink(
                    unwrapping: $coordinator.route,
                    case: /MainCoordinator.Route.detail,
                    destination: {(coordinator: Binding<DetailCoordinator>) in
                        DetailCoordinatorView(
                            coordinator: coordinator.wrappedValue
                        ).navigationBarBackButtonHidden(true)
                    }, onNavigate: {_ in}) {}
                
                NavigationLink(
                    unwrapping: $coordinator.route,
                    case: /MainCoordinator.Route.settings,
                    destination: {(coordinator: Binding<SettingsCoordinator>) in
                        SettingsCoordinatorView(
                            coordinator: coordinator.wrappedValue
                        ).navigationBarBackButtonHidden(true)
                    }, onNavigate: {_ in}) {}
            }
        }
    }
}
