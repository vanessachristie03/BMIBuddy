//
//  genderPage.swift
//  BMIBuddy
//
//  Created by Vanessa on 25/04/24.
//

import SwiftUI

struct genderPage: View {
    @State private var isMaleSelected = false
    @State private var isFemaleSelected = false
    @State private var showAlert = false
    @State private var selectedGender: String?
    @State private var selectedOption: String?
    @Binding var username: String
    var body: some View {
  
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(hex: "A2D0DC"), Color.white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Welcome, \(username)!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, -30.0)
                Text("Please choose your sex")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.vertical, 20)
                
                Button(action: {
                    isMaleSelected.toggle()
                    isFemaleSelected = false
                    selectedGender = isMaleSelected ? "Male" : nil
                }) {
                    ZStack {
                        Rectangle()
                            .fill(Color(hex: "001B48"))
                            .frame(width: 380, height: 180)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white, lineWidth: isMaleSelected ? 4 : 0)
                            )
                        HStack {
                            Text("Male")
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: "A3D0DD"))
                            
                            Image("GMale")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 140)
                                .padding(.leading, 70)
                        }
                    }
                }
                
                Button(action: {
                    isFemaleSelected.toggle()
                    isMaleSelected = false
                    selectedGender = isFemaleSelected ? "Female" : nil
                }) {
                    ZStack {
                        Rectangle()
                            .fill(Color(hex: "FFDBD0"))
                            .frame(width: 380, height: 180)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white, lineWidth: isFemaleSelected ? 4 : 0)
                            )
                        HStack {
                            Text("Female")
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: "CE922A"))
                            
                            Image("GFemale")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 140)
                                .padding(.leading, 30)
                        }
                    }
                }
 
                NavigationLink(destination: dailyActPage(gender: selectedGender ?? "", hint: "Pick one!", options: ["Never", "Rarely", "Normal", "Frequently", "Very Often"], selection: $selectedOption, username: $username))  {
                    Text("Continue")
                        .frame(width: 350, height: 50)
                        .foregroundColor(.white)
                        .background(Color(hex: "A3D0DD"))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 1)
                        )
                }
                .disabled(!isMaleSelected && !isFemaleSelected)
                .onTapGesture {
                    if !isMaleSelected && !isFemaleSelected {
                        showAlert = true
                    } else {
                        if let gender = selectedGender {
                            print("Selected Gender: \(gender)")
                        }
                    }
                }


            }
        }
        
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("No Gender Selected"),
                message: Text("Please select your gender before continuing."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
#Preview {
    genderPage(username:.constant("username"))
}
