//
//  GraphComponentView.swift
//  Crypto_App_iOS
//
//  Created by Zhenya Pavlovskyi on 08.12.2022.
//

import SwiftUI

struct GraphView: View {
    
    @StateObject var viewModel: GraphViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 10) {
                HStack(alignment: .bottom, spacing: 25) {
                    ForEach(viewModel.priceInfoViewModels, id: \.self) { priceInfoViewModel in
                        Rectangle()
                            .foregroundColor(priceInfoViewModel.color)
                            .frame(width: 35, height: (Double(viewModel.fullBarHeight) / viewModel.maxValue) * priceInfoViewModel.price / 250)
                            .cornerRadius(.infinity)
                    }
                }
                divider
                
                HStack(spacing: 9) {
                    ForEach(viewModel.priceInfoViewModels, id: \.self) { val in
                        Text(val.day)
                    }
                    .frame(width: 50, height: 30)
                    .foregroundColor(Color.cultured)
                    .background(Color.monochrom)
                    .cornerRadius(40)
                    .padding(.bottom, 10)
                }
            }
        }
        .frame(width: 330, height: 330, alignment: .bottom)
        .background(Color.noire)
        .cornerRadius(15)
    }
}

private extension GraphView {
    var divider: some View {
        Color.gray
            .cornerRadius(.infinity)
            .frame(height: 5)
            .padding([.trailing, .leading], 25)
    }
}

struct GraphComponentView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView(viewModel: GraphViewModel(periodPrices: .init()))
    }
}
