//
//  Toolbar.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 15.02.2023.
//

import Foundation
import SwiftUI

extension View {
    func createToolBarDetailView(text: String, dismissAction: (() -> Void)?) -> some View {
        self.toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismissAction?()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.white)
                        .padding(.leading, 15)
                })
            }
            ToolbarItem(placement: .principal) {
                Text(text)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
            }
        })
    }
    
    func createToolBarSettingsView(image: String, text: String, dismissAction: (() -> Void)?) -> some View {
        self.toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    dismissAction?()
                }, label: {
                    Image(systemName: image)
                        .foregroundColor(Color.white)
                        .padding(.trailing, 15)
                })
            }
            ToolbarItem(placement: .principal) {
                Text(text)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
            }
        })
    }
}

