//
//  DetailView.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 15.02.2023.
//

import SwiftUI

struct DetailView: View {

    @ObservedObject var viewModel = DetailViewModelImpl(coin: .init(id: "", name: "", price: 1.1, imageURL: ""), detailService: CoinServiceImpl(executor: NetworkRequestExecutor()))

    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        if viewModel.customError {
                            ErrorView()
                        } else {
                            detailView
                        }
                    }
                    createBuyCoinButton(
                        text: "buy".localizedWithVars(
                            vars: viewModel.coin.name),
                        action: {}
                    )
                }
                .createToolBarDetailView(
                    text: String(viewModel.coin.name),
                    dismissAction: {
                        viewModel.navigationBack()
                    }
                )
            }
            .onAppear(perform: viewModel.getDetails)
        }
    }
}

private extension DetailView {
    
    var detailView: some View {
        VStack {
            if viewModel.loadingState {
                DetailLoadingView()
            } else {
                GraphView(viewModel: viewModel.graphViewModel);
                main
            }
        }
    }

    var coinPrice: some View {
        HStack {
            HStack {
                Text("$" + (viewModel.coin.price).toString())
                    .font(.system(size: 16))
                    .foregroundColor(.red)
            }
            .frame(width: 74, height: 24)
            .padding(.horizontal, 10)
            .background(Color.black.opacity(0.2))
            .cornerRadius(15)
            Spacer()
        }
        .padding()
    }

    var news: some View {
        VStack {
            HStack {
                Text("news".localized)
                    .foregroundColor(Color.white)
                    .font(.system( size: 26, weight: .bold))
                    .padding()
                Spacer()
            }
            ForEach(viewModel.news, id: \.id) { news in
                createNewsRow(newsModel: news)
            }
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


    func createNewsRow(newsModel: Details.News) -> some View {
        VStack {
            HStack {
                Text(newsModel.title)
                    .font(.system( size: 20, weight: .bold))
                    .foregroundColor(Color.white)
                    .padding(.leading, 20)
                Spacer()
            }
            HStack {
                Text("\(newsModel.date)".convertCoin(time: newsModel.date))
                    .font(.system( size: 18, weight: .medium))
                    .foregroundColor(Color.gray.opacity(0.8))
                    .padding(.leading, 20)
                Spacer()
            }
            createDivider
        }
        .padding(.top, 10)
    }

    func createBuyCoinButton(text: String, action: (() -> Void)?) -> some View {
        VStack {
            Button(action: {action?()}) {
                Text(text)
                    .font(.system( size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .frame(width: 330)
        .background(Color.monochrom)
        .cornerRadius(15)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(
            viewModel: DetailViewModelImpl(
                coin: Coins.Coin(
                    id: "",
                    name: "",
                    price: 100,
                    imageURL: ""),
                detailService: CoinServiceImpl(
                    executor: NetworkRequestExecutor()
                )
            )
        )
    }
}
