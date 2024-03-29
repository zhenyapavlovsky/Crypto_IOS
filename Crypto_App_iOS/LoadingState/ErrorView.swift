//
//  ErrorView.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 07.03.2023.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            VStack {
                detailError
            }
        }
    }
}

private extension ErrorView {
    
    var textError: some View {
        VStack {
            Text("error".localized)
                .font(.system(size: 18, weight: .bold))
                .bold()
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
            Text("tapButton".localized)
                .font(.system(size: 18, weight: .bold))
                .bold()
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
        }
        .frame(width: 300, alignment: .center)
    }
    
    var errorImage: some View {
        Image.errorImage
            .resizable()
            .frame(width: 100, height: 100)
    }
    
    var detailError: some View {
        VStack(spacing: 40) {
            errorImage
            textError
            Spacer()
                .createMainButton(text: "Try again", action: {})
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}

