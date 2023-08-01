//
//  SettingsView.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 16.02.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        VStack {
            NavigationView {
                ZStack {
                    Color.backgroundColor
                        .ignoresSafeArea()
                    VStack {
                        ScrollView {
                            buttonList
                                .listRowBackground(Color.backgroundColor)
                        }
                        .scrollContentBackground(.hidden)
                    }
                    .background(Color.backgroundColor)
                    .createToolBarSettingsView(
                        image: "xmark",
                        text: "settings".localized,
                        dismissAction: {
                            viewModel.navigationBack()
                        }
                    )
                }
            }
        }
    }
}

private extension SettingsView {
    
    var buttonList: some View {
        VStack(spacing: 20) {
            createButtonForToggle(
                text: "notification".localized,
                isOn: viewModel.isOn
            )
            createButton(text: "our_website".localized)
            createButtonVersion(text: "version".localized, version: "\(Bundle.main.appVersion)")
        }
    }
    
    func createButtonForToggle(text: String, isOn: Bool) -> some View {
        VStack {
            HStack {
                HStack {
                    Text(text)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding()
                    Spacer()
                    Toggle(isOn: $viewModel.isOn, label: {})
                        .toggleStyle(SwitchToggleStyle(tint: Color.white))
                        .tag("toggle")
                        .frame(width: 60, height: 40)
                }
                .padding([.leading,.trailing],10)
            }
            .frame(width: 330, height: 70)
            .background(Color.monochrom)
            .cornerRadius(15)
        }
    }
    
    func createButton(text: String) -> some View {
        ZStack {
            Button(action: {}) {
                HStack {
                    Text(text)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(.system( size: 18, weight: .bold))
                        .padding(.horizontal, 20)
                }
                .frame(width: 330, height: 70)
                .background(Color.monochrom)
                .cornerRadius(15)
            }
            .padding([.leading,.trailing], 10)
        }
    }
    
    func createButtonVersion(text: String, version: String) -> some View {
        ZStack {
            Button(action: {}) {
                HStack {
                    HStack {
                        Text(text)
                            .foregroundColor(Color.white)
                            .font(.system( size: 18, weight: .bold))
                            .padding()
                        Spacer()
                        Text("\(version)")
                            .frame(height: 30)
                            .font(.system(size: 16, weight: .medium))
                            .padding(.horizontal, 15)
                            .background(Color.backgroundColor.opacity(0.8))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding([.leading,.trailing], 10)
            .frame(width: 330, height: 70)
        }
        .background(Color.monochrom)
        .cornerRadius(15)
        .frame(width: 330, height: 70)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: .init())
    }
}
