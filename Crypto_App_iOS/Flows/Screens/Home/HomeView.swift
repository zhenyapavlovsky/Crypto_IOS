//
//  HomeView.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 06.12.2022.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.loadingState {
                    HomeLoadingView()
                } else {
                    VStack {
                        ScrollView {
                            coinList
                                .listRowBackground(Color.backgroundColor)
                        }
                        buttonSettings
                    }
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            toolBarCrypto
                        }
                    }
                     .navigationBarTitleDisplayMode(.inline)
                }
            }
            .background(Color.backgroundColor)
            .onAppear(perform: viewModel.getCoins)
        }
    }
}

private extension HomeView {
    
    var buttonSettings: some View {
        Button(action: {
            viewModel.selectSettings()
        }, label: {
            Image.settingsButton
        })
        .frame(width: 75, height: 75)
        .background(Color.monochrom)
        .cornerRadius(15)
        .offset(x:140, y: 0)
    }
    
    var toolBarCrypto: some View {
        Text("Crypto")
            .fontWeight(.heavy)
            .font(.system(size: 25))
            .foregroundColor(Color.cultured)
    }
    
    var coinList: some View {
        VStack {
            VStack(spacing: 10) {
                ForEach(viewModel.coins) { coins in
                    createButton(
                        coin: coins,
                        action: {
                            viewModel.selectCoinItem(
                                coinName: coins
                            )
                        }
                    )
                    .background(Color.carbon)
                    .cornerRadius(15)
                    .padding([.leading,.trailing], 20)
                }
                .padding(.bottom, 15)
            }
        }
    }
    
    func createButton(coin: Coins.Coin, action: (() -> Void)?) -> some View {
        VStack {
            Button(action: {
                action?()
            }) {
                HStack {
                    AsyncImage(url: URL(string: coin.imageURL)) { image in
                        image.image?.resizable()
                    }
                    .foregroundColor(Color.white)
                    .frame(width: 30, height: 30)
                    Text(coin.name)
                        .font(.system( size: 18, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding()
                    Spacer()
                    Text("$" + String(format:"%.2f", coin.price))
                        .frame(height: 30)
                        .padding(.horizontal, 10)
                        .font(.system(size: 16, weight: .medium))
                        .background(Color.charcoal.opacity(0.8))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .cornerRadius(15)
                .padding([.leading,.trailing], 20)
            }
            .frame(height: 70)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            viewModel: HomeViewModelImpl(
                coinService: CoinServiceImpl(
                    executor: NetworkRequestExecutor()
                )
            )
        )
    }
}
