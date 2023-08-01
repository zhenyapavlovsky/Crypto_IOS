//
//  ContentView.swift
//  Crypto_App_iOS
//
//  Created by Vasyl Nadtochii on 25.11.2022.
//


import SwiftUI

struct IntroView: View {
    
    @ObservedObject var viewModel: IntroViewModel
    
    var body: some View {
        VStack {
            VStack {
                welcomeTitle
                toTheCryptoTitle
            }
            .padding(.top, 25)
            .opacity(viewModel.titleShown ? 1.0 : 0.0)
            .onAppear() {
                withAnimation(Animation.easeInOut(duration: 1.0))
                {
                    viewModel.titleShown.toggle()
                    
                }
            }
            Spacer()
            
            bottomButton
            
                .padding(.bottom, 30)
                .opacity(viewModel.buttonShown ? 1.0 : 0.0)
                .onAppear() {
                    withAnimation(Animation.easeInOut(duration: 2.0))
                    {
                        viewModel.buttonShown.toggle()
                        
                    }
                }
            
        } .background(
            Image.homeBackgroun
                .ignoresSafeArea()
            
        )
    }
}


private extension IntroView {
    
    var welcomeTitle: some View {
        Text("welcome")
            .foregroundColor(Color.cultured)
            .font(.system(size: 45))
            .fontWeight(.heavy)
    }
    
    var toTheCryptoTitle: some View {
        Text("to_the_crypto")
            .foregroundColor(Color.cultured)
            .font(.system(size: 35))
            .fontWeight(.bold)
    }
    
    var bottomButton: some View {
        Button(action: {
            viewModel.startButton()
        }, label: {
            Text("let's_start")
                .fontWeight(.bold)
                .foregroundColor(Color.cultured)
                .frame(width: UIScreen.main.bounds.width - 120)
                .padding()
        })
        .background(Color.monochrom)
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(viewModel: .init(preferences: PreferencesImpl()))
    }
}

