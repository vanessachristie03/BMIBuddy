//
//  calculatePage.swift
//  BMIBuddy
//
//  Created by Vanessa on 26/04/24.
//

import SwiftUI

struct calculatePage: View {
    
    @State private var weight: String = "50"
    @State private var tall: String = "150"
    @State private var age: String = "20"
  
    @State private var lastWeight: String = ""
    @State private var lastTall: String = ""
    @State private var lastAge: String = ""
    
    @State private var bmiResult: String = ""
    @State private var idealWeight: String = ""
    @State private var isShowingResult: Bool = false
    @Binding var selectedOption: String?
    var gender: String
    @State private var bmrResult: Double = 0
    @State private var selectedActivityMultiplier: Double = 0
    @State private var calculatedData: String = ""
    @State private var isShowingMainPage = false
    @Binding var username: String
    @State private var bmiDescriptionValue: String = ""
    
    var body: some View {
        ZStack {
            gradientColor
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    Spacer()
//                    Text("Selected Option: \(selectedOption ?? "None")")
//                    Text("Welcome, \(username)!")
                    Text("Input your  Weight, Tall, and Age")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                    
                    HStack {
                        // Weight
                        VStack(spacing: 15) {
                            Text("Weight (kg)")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            
                            TextField("Enter weight", text: $weight)
                                .font(Font.custom("SF Pro", size: 30).weight(.bold))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .frame(width: 110, height: 40)
                                .background(Color.white)
                                .cornerRadius(8)
                                .keyboardType(.numberPad)
                                .toolbar {
                                    ToolbarItem(placement: .keyboard) {
                                        Spacer()
                                    }
                                    ToolbarItem(placement: .keyboard) {
                                        Button("Done") {
                                            doneButtonTapped()
                                        }
                                        .foregroundColor(.blue)
                                    }
                                }
                            
                            HStack(spacing: 35) {
                                Button(action: {
                                    if let value = Int(weight), value > 0 {
                                        weight = String(value - 1)
                                    }
                                }) {
                                    Image(systemName: "minus")
                                        .foregroundColor(.blue)
                                }
                                .frame(width: 40, height: 40)
                                .background(Color.white)
                                .cornerRadius(20)
                                .disabled(Int(weight) ?? 0 <= 1)
                                
                                Button(action: {
                                    if let value = Int(weight) {
                                        weight = String(value + 1)
                                    }
                                }) {
                                    Image(systemName: "plus")
                                        .foregroundColor(.blue)
                                }
                                .frame(width: 40, height: 40)
                                .background(Color.white)
                                .cornerRadius(20)
                            }
                            .frame(width: 110, height: 40)
                        }
                        .padding(25)
                        .frame(width: 170, height: 184)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color(red: 0.01, green: 0.27, blue: 0.48), Color(red: 0.59, green: 0.79, blue: 0.85)]), startPoint: .top, endPoint: .bottom)
                        )
                        .cornerRadius(30)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 6, y: 2)
                        
                        // Tall
                        VStack(spacing: 15) {
                            Text("Tall (cm)")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            
                            TextField("Enter tall", text: $tall)
                                .font(Font.custom("SF Pro", size: 30).weight(.bold))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .frame(width: 110, height: 40)
                                .background(Color.white)
                                .cornerRadius(8)
                                .keyboardType(.numberPad)
                            
                            HStack(spacing: 35) {
                                Button(action: {
                                    if let value = Int(tall), value > 0 {
                                        tall = String(value - 1)
                                    }
                                }) {
                                    Image(systemName: "minus")
                                        .foregroundColor(.blue)
                                }
                                .frame(width: 40, height: 40)
                                .background(Color.white)
                                .cornerRadius(20)
                                .disabled(Int(tall) ?? 0 <= 1)
                                
                                Button(action: {
                                    if let value = Int(tall) {
                                        tall = String(value + 1)
                                    }
                                }) {
                                    Image(systemName: "plus")
                                        .foregroundColor(.blue)
                                }
                                .frame(width: 40, height: 40)
                                .background(Color.white)
                                .cornerRadius(20)
                            }
                            .frame(width: 110, height: 40)
                        }
                        .padding(25)
                        .frame(width: 170, height: 184)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color(red: 0.01, green: 0.27, blue: 0.48), Color(red: 0.59, green: 0.79, blue: 0.85)]), startPoint: .top, endPoint: .bottom)
                        )
                        .cornerRadius(30)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 6, y: 2)
                    }
                    
                    // Age
                    VStack(spacing: 15) {
                        Text("Age")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        
                        TextField("Enter age", text: $age)
                            .font(Font.custom("SF Pro", size: 30).weight(.bold))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(width: 110, height: 40)
                            .background(Color.white)
                            .cornerRadius(8)
                            .keyboardType(.numberPad)
                        
                        HStack(spacing: 35) {
                            Button(action: {
                                if let value = Int(age), value > 0 {
                                    age = String(value - 1)
                                }
                            }) {
                                Image(systemName: "minus")
                                    .foregroundColor(.blue)
                            }
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .cornerRadius(20)
                            .disabled(Int(age) ?? 0 <= 1)
                            
                            Button(action: {
                                if let value = Int(age) {
                                    age = String(value + 1)
                                }
                            }) {
                                Image(systemName: "plus")
                                    .foregroundColor(.blue)
                            }
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .cornerRadius(20)
                        }
                        .frame(width: 110, height: 40)
                    }
                    .padding(10.0)
                    .frame(width: 170, height: 184)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(red: 0.01, green: 0.27, blue: 0.48), Color(red: 0.59, green: 0.79, blue: 0.85)]), startPoint: .top, endPoint: .bottom)
                    )
                    .cornerRadius(30)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 6, y: 2)
                    
                    Button(action: {
                        lastWeight = weight
                        lastTall = tall
                        lastAge = age
                        
                        // Calculate BMI
                        if let weight = Double(lastWeight), let tall = Double(lastTall), tall > 0 {
                            let bmi = weight / pow(tall / 100, 2)
                            bmiResult = String(format: "%.1f", bmi)
                            
                            // Calculate Ideal Weight
                            let idealWeightValue = calculateIdealWeight(tall: tall, gender: gender)
                            idealWeight = String(format: "%.1f", idealWeightValue)
                            
                            
                            bmrResult = calculateBMR()
                            bmiDescriptionValue = bmiDescription(for: bmi)
                            print(bmiDescriptionValue)

                            isShowingResult = true
                        }
                    }) {
                        Text("Start Calculate")
                            .frame(width: 350, height: 50)
                            .foregroundColor(.white)
                            .background(Color(hex: "A3D0DD"))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                    }

                    .padding(.top, 30.0)
                }
                .padding()
            }
            
            if isShowingResult {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 1)

                ZStack {
                    Spacer()
                    
                    VStack {
                        Text("Your Result")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Your BMI is")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                        Text("\(bmiResult)")
                            .font(Font.system(size: 30).weight(.bold))
                            .foregroundColor(fontColorForBMI(bmiValue: Double(bmiResult) ?? 0.0))
                            .padding(.bottom, 10)
                        Text(bmiDescription(for: Double(bmiResult) ?? 0.0))
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.bottom, 20)
                        Image("Divider")
                        HStack{
                            Text("Your Ideal Weight is ")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                              
                            Spacer()
                            Text("\(idealWeight) kg")
                                .font(Font.system(size: 18).weight(.bold))

                 
                        }
                        .padding([.leading, .bottom, .trailing], 20.0)
                        HStack{
                            Text("Your daily calories intake is")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                
                            Spacer()
                            Text("\(String(format: "%.2f", bmrResult)) kkal")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .padding(.bottom, 10)
                        }
                        .padding([.leading, .bottom, .trailing], 20.0)
                        Button("OK") {
                            calculatedData = "\(bmiResult), \(idealWeight), \(String(format: "%.2f", bmrResult))"
                            print("Calculated data: \(calculatedData)")
                            isShowingMainPage = true
                        }

                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                    }


                    .fullScreenCover(isPresented: $isShowingMainPage) {
                        MainPage(calculatedData: $calculatedData,username: $username, bmrResult:$bmrResult,bmiResult:$bmiResult,idealWeight:$idealWeight, bmiDescriptionValue: $bmiDescriptionValue, dataNumber:1)
                            }
                    .frame(width: 300, height: 500)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 10)
                    
                    Spacer()
                }
            }
        }
    }
    func calculateBMR() -> Double {
        let weightValue = Double(lastWeight) ?? 0
        let tallValue = Double(lastTall) ?? 0
        let ageValue = Double(lastAge) ?? 0

        let baseBMR: Double
        if gender.lowercased() == "male" {
            baseBMR = 66.5 + (13.7 * weightValue) + (5 * tallValue) - (6.8 * ageValue)
        } else {
            baseBMR = 655 + (9.6 * weightValue) + (1.8 * tallValue) - (4.7 * ageValue)
        }

        var activityMultiplier: Double = 1.0
        switch selectedOption {
        case "Never":
            activityMultiplier = 1.2
        case "Rarely":
            activityMultiplier = 1.375
        case "Normal":
            activityMultiplier = 1.55
        case "Frequently":
            activityMultiplier = 1.725
        case "Very Often":
            activityMultiplier = 1.9
        default:
            activityMultiplier = 1.0
        }

        // Calculate final BMR
        let bmrResult = baseBMR * activityMultiplier
        return bmrResult
    }


    
    func bmiDescription(for bmiValue: Double) -> String {
        switch bmiValue {
        case ..<18.5:
            return "Underweight"
        case 18.5..<25.0:
            return "Healthy Weight"
        case 25.0..<30.0:
            return "Overweight"
        default:
            return "Obesity"
        }
    }
    func fontColorForBMI(bmiValue: Double) -> Color {
        switch bmiValue {
        case ..<18.5:
            return .red // Underweight (red)
        case 18.5..<25.0:
            return .green // Healthy Weight (green)
        case 25.0..<30.0:
            return .red // Overweight (red)
        default:
            return .red // Obesity (red)
        }
    }
    
    var gradientColor: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color(hex: "A2D0DC"), Color.white]), startPoint: .top, endPoint: .bottom)
    }
}

    func doneButtonTapped() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
func calculateIdealWeight(tall: Double, gender: String) -> Double {
        if gender.lowercased() == "male" {
            return (tall - 100) - ((tall - 100) * 0.10)
        } else {
            return (tall - 100) - ((tall - 100) * 0.15)
        }
    }

#Preview {
    let selectedOption = Binding<String?>(
                get: { "lala" },
                set: { _ in }
            )
    return calculatePage(selectedOption: selectedOption, gender: "male",username: .constant("username"))
}
