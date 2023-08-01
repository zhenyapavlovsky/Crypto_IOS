//
//  HomeLoadingView.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 10.03.2023.
//


import SwiftUI

struct HomeLoadingView: View {
    var body: some View {
        VStack {
            ScrollView {
                coinList
                    .listRowBackground(Color.backgroundColor)
            }
            buttonSettings
        }
        .background(Color.backgroundColor)
        .toolbar {
            ToolbarItem(placement: .principal) {
                toolBarCrypto
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension HomeLoadingView {
    
    var coinList: some View {
        VStack {
            VStack(spacing: 10) {
                ForEach(0...5, id: \.self) { _ in
                    createButton()
                }
                .background(Color.noire)
                .cornerRadius(15)
                .padding([.leading,.trailing], 20)
            }
            .padding(.bottom, 15)
        }
    }
    
    var buttonSettings: some View {
        Button(action: {}, label: {
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
    
    func createButton() -> some View {
        VStack {
            Button(action: {}) {
                HStack {
                    ShimmerView()
                        .frame(width: 30, height: 30)
                        .cornerRadius(.infinity)
                    Spacer()
                    Text("")
                    ShimmerView()
                        .frame(height: 30)
                        .cornerRadius(.infinity)
                }
                .cornerRadius(15)
                .padding([.leading,.trailing], 20)
            }
            .frame(height: 70)
        }
    }
}

struct HomeLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        HomeLoadingView()
    }
}
