//
//  Button.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 07.03.2023.
//

import Foundation
import SwiftUI

extension View {
    
    func createMainButton(text: String, action: (() -> Void)?) -> some View {
        VStack {
            Button(action: {
                action?()}
            ){
                Text(text)
                    .font(.system( size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
            }
            .frame(width: 330, height: 70)
            .background(Color.monochrom)
            .cornerRadius(15)
        }
    }
}
