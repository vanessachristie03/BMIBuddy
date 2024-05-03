//
//  ContentView.swift
//  BMIBuddy
//
//  Created by Vanessa on 24/04/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var calculatedData: String
    @Binding var bmrResult: Double
    @Binding var bmiResult: String
    @Binding var idealWeight: String
    @Binding var bmiDescriptionValue: String
    
    var body: some View {
        NavigationView {
            ZStack {
                gradientColor
                VStack {
                    Image("Logo2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400)
                    VStack {
                        Spacer()
                        Text("Track Your Ideal ")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("Height")
                            .foregroundColor(Color(hex: "A3D0DD"))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                        Text("Your personalized health and fitness assistant, calculating BMI, guiding ideal weight goals, and recommending daily calorie needs for a healthier you.")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding([.top, .leading, .trailing], 3.0)
                        Spacer()
                        NavigationLink(destination: MainPage(calculatedData: $calculatedData, bmrResult: $bmrResult, bmiResult: $bmiResult, idealWeight: $idealWeight, bmiDescriptionValue: $bmiDescriptionValue, gender: "Gender"))
 {
                            Text("Start")
                                .frame(width: 200, height: 50)
                                .foregroundColor(.white)
                                .background(Color(hex: "A3D0DD"))
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                        }
                        
                    }
                    .background(
                        GeometryReader { geometry in
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width * 2, height: geometry.size.width * 2)
                                .rotationEffect(.degrees(90))
                                .offset(x: -(geometry.size.width * 0.5), y: geometry.size.height / 30)
                                .clipped()
                                .offset(CGSize(width: -10, height: 0))
                        }
                        .frame(maxHeight: .infinity)
                        .ignoresSafeArea()
                    )
                }
                .background(gradientColor)
            }
        }
    }
    
    var gradientColor: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color(hex: "A2D0DC"), Color.white]), startPoint: .top, endPoint: .bottom)
    }
}


extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0

        if scanner.scanHexInt64(&rgbValue) {
            let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgbValue & 0x0000FF) / 255.0
            self.init(red: red, green: green, blue: blue)
            return
        }
        
        self.init(red: 0, green: 0, blue: 0) 
    }
}


#Preview {
    ContentView(calculatedData:.constant("calculatedData"),bmrResult:.constant(0.0), bmiResult:.constant("calculatedData"),idealWeight: .constant("calculatedData"), bmiDescriptionValue: .constant("calculatedData"))
}
