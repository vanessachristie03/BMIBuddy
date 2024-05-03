////
////  signIn.swift
////  BMIBuddy
////
////  Created by Vanessa on 25/04/24.
////
//
//import SwiftUI
//
//struct signIn: View {
//    @State private var username: String = ""
//    @State private var showError: Bool = false
//    @State private var navigateToGenderPage: Bool = false
//    
//    var body: some View {
//        NavigationView {
//            ZStack {
//                LinearGradient(gradient: Gradient(colors: [Color(hex: "A2D0DC"), Color.white]), startPoint: .top, endPoint: .bottom)
//                    .edgesIgnoringSafeArea(.all)
//                
//                VStack {
//                    Spacer()
//                    Text("Full name")
//                        .font(.title)
//                        .fontWeight(.semibold)
//                        .padding(.bottom, 20)
//                    
//                    TextField("Enter full name", text: $username)
//                        .controlSize(.small)
//                        .textFieldStyle(MyTextFieldStyle()).border(Color.blue)
//                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 20, trailing: 10))
//                        .frame(maxWidth: .infinity)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 8)
//                                .stroke(showError && username.isEmpty ? Color.clear: Color.clear, lineWidth: 1)
//                        )
//                        .offset(x: showError && username.isEmpty ? 0 : CGFloat.zero)
//                    
//                    Button(action: {
//                                            if username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
//                                                showError = true
//                                            } else {
//                                                showError = false
//                                                navigateToGenderPage = true
//                                            }
//                                        }) {
//                                            Text("Continue")
//                                                .frame(width: 350, height: 40)
//                                                .foregroundColor(.white)
//                                                .background(Color(hex: "A3D0DD"))
//                                                .cornerRadius(8)
//                                                .overlay(
//                                                    RoundedRectangle(cornerRadius: 8)
//                                                        .stroke(Color.white, lineWidth: 1)
//                                                )
//                                        }
//                                        
//                                        if showError {
//                                            Text("Name is required")
//                                                .foregroundColor(.red)
//                                                .padding(.bottom, 8)
//                                        }
//                    
//                    Spacer()
//                }
//                .padding()
//            }
//            .background(
//                NavigationLink(destination: genderPage(username: $username), isActive: $navigateToGenderPage) {
//                    EmptyView()
//                }
//                .hidden()
//            )
//        }
//        .navigationBarHidden(true)
//    }
//}
//struct MyTextFieldStyle: TextFieldStyle {
//    func _body(configuration: TextField<Self._Label>) -> some View {
//        configuration
//        .padding(20)
//        .background(
//            RoundedRectangle(cornerRadius: 20)
//                .stroke(Color.blue, lineWidth: 3)
//        ).padding()
//    }
//}
//
//#Preview {
//    signIn()
//}
