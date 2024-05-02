//
//  StartPage.swift
//  BMIBuddy
//
//  Created by Vanessa on 25/04/24.
//

import SwiftUI

struct StartPage: View {
    @State private var isActive = false
    @State private var size: CGFloat = 0.8
    @State private var opacity = 0.5

    
    var body: some View {
        ZStack {
            gradientColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            self.isActive = true
                        }
                    }
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            ContentView()
        }
    }
    
    var gradientColor: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color(hex: "A2D0DC"), Color.white]), startPoint: .top, endPoint: .bottom)
    }
}
#Preview {
    StartPage()
}


