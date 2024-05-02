//
//  MainPage.swift
//  BMIBuddy
//
//  Created by Vanessa on 01/05/24.
//

import SwiftUI

struct MainPage: View {
    @Binding var calculatedData: String
    @Binding var username: String
    @Binding var bmrResult: Double
    @Binding var bmiResult: String
    @Binding var idealWeight: String
    @Binding var bmiDescriptionValue: String
    
    var dataNumber: Int // Variable to keep track of the data number
    
    var body: some View {
        NavigationView {
            ZStack {
                gradientColor
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Hi, \(username)!")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    Text("Calculation History")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                    if !calculatedData.isEmpty {
                        ZStack{
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.white)
                                .frame(width: 300, height: 200)
                                .shadow(radius: 10)
                            
                            VStack(spacing: 10) {
                                Text("\(dataNumber).") // Display the data number
                                    .font(.headline)
                                
                                Text("BMI: \(bmiResult)")
                                    .padding(.horizontal)
                                Text("\(bmiDescriptionValue)")
                                    .padding(.horizontal)
                                
                                Text("Ideal Weight: \(idealWeight) kg")
                                    .padding(.horizontal)
                                
                                Text("Daily Calories Intake: \(String(format: "%.2f", bmrResult)) kcal")
                                    .padding(.horizontal)
                            }
                        }
                    }
//                    NavigationLink(destination: dailyActPage(gender: gender, hint: "Pick one!", options: ["Never", "Rarely", "Normal", "Frequently", "Very Often"], selection: $selectedOption, username: username)) {
//                        Text("Calculate Again")
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.blue)
//                            .cornerRadius(8)
//                    }
//                    .padding()
                }
            }
        }
    }
    
    var gradientColor: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color(hex: "A2D0DC"), Color.white]), startPoint: .top, endPoint: .bottom)
    }
}


#Preview {
    MainPage(calculatedData:.constant("calculatedData"),username: .constant("username"),bmrResult:.constant(0.0), bmiResult:.constant("calculatedData"),idealWeight: .constant("calculatedData"), bmiDescriptionValue: .constant("calculatedData"), dataNumber: 1)
}
