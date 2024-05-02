//
//  dailyActPage.swift
//  BMIBuddy
//
//  Created by Vanessa on 25/04/24.
//

import SwiftUI
enum Anchor {
    case top, bottom
}
struct dailyActPage: View {
    @State private var isShowingInfo = false
    @State private var isNextButtonTapped = false
    var gender: String
    var hint: String
    var options: [String] = ["Never", "Rarely", "Normal", "Frequently", "Very Often"]
    var anchor: Anchor = .bottom
    var maxWidth: CGFloat = 180
    var cornerRadius: CGFloat = 15
    @Binding var selection: String?
    @State private var showOptions: Bool = false
    @State private var isSelectionMade = false
    @Environment(\.colorScheme) private var scheme
    @State private var showAlert = false
    @State private var redirectToCalculatePage = false
    @Binding var username: String
    var body: some View {
        ZStack {
            gradientColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
           
                Text("How often do you exercise?")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                HStack {
                    Text("More info")
                    Button(action: {
                        isShowingInfo.toggle()
                    }) {
                        Image(systemName: "info.circle")
                            .foregroundColor(.black)
                    }
                }
                
                VStack(spacing: 0){
                    HStack(spacing: 0) {
                        Text(selection ?? hint)
                            .foregroundColor(selection != nil ? .primary : .gray)
                            .lineLimit(1)
                        
                        Spacer(minLength: 0)
                        Image(systemName: "chevron.down")
                            .font(.title3)
                            .foregroundStyle(.gray)
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    showOptions.toggle()
                                }
                            }
                            .rotationEffect(.init(degrees: showOptions ? -180 : 0))
                        
                    }
                    .padding(.horizontal, 15)
                    .frame(height: 50)
                    .contentShape(.rect)
                    .onTapGesture{}
                    if showOptions{
                        OptionsView()
                    }
                }
                .background((scheme == .dark ? Color.black :
                                Color.white) .shadow(.drop(color: .primary.opacity(0.15), radius: 4)), in: .rect(cornerRadius: cornerRadius))
                .frame(width: maxWidth)
                .padding()
                
                Button(action: {
                    if !isSelectionMade {
                        showAlert = true
                    } else {
                        redirectToCalculatePage = true
                    }
                }) {
                    Text("Next")
                        .frame(width: 350, height: 50)
                        .foregroundColor(.white)
                        .background(Color(hex: "A3D0DD"))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .padding()
                }
            }
            .padding()
            
            if isShowingInfo {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 1)
                
                ZStack {
                    Spacer()
                    
                    VStack {
                        
                        Text("Information")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top)
                        Text("-Never: Never Exercise\n-Rarely: 1-3 days/week\n-Normal: 3-5 days/week\n-Frequently : 6-7 days/week\n-Very often: every day can be 2x in a day")
                            .multilineTextAlignment(.leading)
                            .padding(.top)
                        Button("OK") {
                            isShowingInfo = false
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                    }
                    .frame(width: 300, height: 300)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 10)
                    
                    Spacer()
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("No Selection Made"),
                message: Text("Please select an option before continuing."),
                dismissButton: .default(Text("OK"))
            )
        }
        // NavigationLink yang diaktifkan saat redirectToCalculatePage adalah true
        NavigationLink(destination: calculatePage(selectedOption: $selection, gender: gender,username: $username), isActive: $redirectToCalculatePage) {
            EmptyView()
        }
        .hidden()

    }
    
    @ViewBuilder
    func OptionsView() -> some View {
        VStack(spacing: 10) {
            ForEach(options, id: \.self) { option in
                HStack(spacing: 0) {
                    Text(option)
                        .lineLimit(1)
                    Spacer(minLength: 0)
                    Image(systemName: "checkmark")
                        .opacity(selection == option ? 1 : 0)
                        .foregroundColor(selection == option ? Color.primary : Color.gray)
                        .animation(.none, value: selection)
                        .frame(height: 40)
                        .contentShape(Rectangle())
                    
                }
                .onTapGesture {
                    withAnimation(.snappy) {
                        selection = option
                        showOptions = false
                        isSelectionMade = true
                    }
                }
                
            }
        }
        .padding(.horizontal, 15)
    }
    
    var gradientColor: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color(hex: "A2D0DC"), Color.white]), startPoint: .top, endPoint: .bottom)
    }
}



    
    
#Preview {
    dailyActPage(gender: "male", hint: "lala", options: ["lala"], selection: .constant("lala"), username: .constant("username"))
}


