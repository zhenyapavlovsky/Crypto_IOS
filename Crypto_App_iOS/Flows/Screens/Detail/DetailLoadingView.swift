//
//  DetailLoadingView.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 10.03.2023.
//
//

import SwiftUI

struct DetailLoadingView: View {

    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            VStack {
                ScrollView {
                    ShimmerView()
                        .frame(width: 330,height: 345)
                        .cornerRadius(15)
                        .padding(.leading, 11)
                    main
                }
            }
        }
    }
}

private extension DetailLoadingView {
    
    var coinPrice: some View {
        HStack {
            ShimmerView()
                .frame(width: 85, height: 40)
                .cornerRadius(15)
                .padding(.leading, 20)
            Spacer()
        }
        .padding()
    }
    
    var news: some View {
        VStack {
            createNewsRow()
            createNewsRow()
            createNewsRow()
        }
    }
    
    var main: some View {
        VStack {
            coinPrice
            news
        }
    }
    
    var createDivider: some View {
        Divider()
            .frame( width: UIScreen.main.bounds.width / 1.1, height: 1)
            .background(Color.gray)
    }
    
    func createNewsRow() -> some View {
        VStack {
            HStack {
                ShimmerView()
                    .frame(width: 330,height: 35)
                    .cornerRadius(15)
                    .padding(.leading, 30)
                Spacer()
            }
            HStack {
                ShimmerView()
                    .frame(width: 130,height: 20)
                    .cornerRadius(15)
                    .padding(.leading, 30)
                Spacer()
            }
            createDivider
        }
        .padding(.top, 10)
    }
}

struct DetailLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        DetailLoadingView()
    }
}
