//
//  DetailCoordinationView.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 19.02.2023.
//

import SwiftUI
import SwiftUINavigation

struct DetailCoordinatorView: View {
    
    @ObservedObject var coordinator: DetailCoordinator
    
    var body: some View {
        NavigationView {
            ZStack {
               DetailView(viewModel: coordinator.detailViewModel)
            }
        }
    }
}
