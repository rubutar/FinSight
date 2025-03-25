//
//  SplashScreenView.swift
//  FinSight
//
//  Created by Delilah Mentari on 24/03/25.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isSplashScreenActive = true
            
        var body: some View {
            ZStack {
                if isSplashScreenActive {
                    SplashScreen()
                } else {
                    MainView()
                }
            }
            .onAppear {
                // Menunda tampilan splash screen selama 3 detik sebelum pindah ke MainView
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        isSplashScreenActive = false
                    }
                }
            }
        }
}

struct SplashScreen: View {
    var body: some View {
        VStack {
            Image(.image)
                .resizable()
                .frame(width: 300, height: 300)
            
            Text("FinSight")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Smart Budgeting, Clear Insights. Track your expenses, manage your budget, and gain valuable financial insights effortlessly!")
                .font(.body)
                .foregroundColor(.bgThemeGreen)
                .multilineTextAlignment(.center)
                .padding(.bottom,100)
            
        }
        //LinearGradient(gradient: Gradient(colors: [Color.background,color.white.opacity(0,4)]))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.background(Color)
        .background(Color.white)
        .foregroundColor(.bgThemeGreen)
    }
}

struct InsightView: View {
    var body: some View {
        VStack {
            Text("")
                .font(.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    SplashScreenView()
}
