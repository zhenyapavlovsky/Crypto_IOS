//
//  SettingCoordinationView.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 19.02.2023.
//

import SwiftUI

struct SettingsCoordinatorView: View {
    
    @ObservedObject var coordinator: SettingsCoordinator
    
    var body: some View {
        NavigationView {
            ZStack {
                SettingsView(viewModel: coordinator.settingsViewModel)
            }
        }
    }
}
