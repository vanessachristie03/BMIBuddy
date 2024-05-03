//
//  MainPage.swift
//  BMIBuddy
//
//  Created by Vanessa on 01/05/24.
//


import SwiftUI
import SwiftData

struct MainPage: View {
    @Environment(\.modelContext) private var context
    @Query private var items: [BMIdata]
    @Binding var calculatedData: String
    @Binding var bmrResult: Double
    @Binding var bmiResult: String
    @Binding var idealWeight: String
    @Binding var bmiDescriptionValue: String
    @State private var selectedOption: String?
    @State private var bmiData = BMIdata(bmrResult: 0.0, bmiResult: "", idealWeight: "", bmiDescriptionValue: "", selectedOption: nil, gender: "")

    var gender: String
    
    // Flag for sorting order
    @State private var isDescendingOrder = true

    var body: some View {
        NavigationView {
            ZStack {
                gradientColor
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack{
                        Text("Calculation History")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        Spacer()
                        Button(action: {
                            // Toggle sorting order
                            isDescendingOrder.toggle()
                        }) {
                            Image(systemName: isDescendingOrder ? "arrow.up" : "arrow.down")
                                .foregroundColor(.black)
                        }
                        .padding(.trailing)
                    }
                    Spacer()
                    if shouldShowNoHistoryMessage {
                        VStack {
                            Text("No Calculation History")
                                .font(.headline)
                                .padding()
                            Spacer()
                            NavigationLink(destination: genderPage()) {
                                Text("Calculate")
                                    .frame(width: 350, height: 50)
                                    .foregroundColor(.white)
                                    .background(Color(hex: "A3D0DD"))
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.white, lineWidth: 1)
                                    )
                            }
                        }
                    } else {
                        
                        VStack(spacing: 20) {
                            ScrollView {
                                ForEach(sortedItems, id: \.id) { item in
                                    VStack(spacing: 10) {
                                        HStack{
                                            Text("BMI: \(item.bmiResult)")
                                                .padding(.horizontal)
                                            Spacer()
                                        }
                                       
                                        HStack{
                                            Text("Ideal Weight: \(item.idealWeight) kg")
                                                .padding(.horizontal)
                                            Spacer()
                                        }
                                        HStack{
                                            Text("Daily Calories Intake: \(String(format: "%.2f", item.bmrResult)) kcal")
                                                .padding(.horizontal)
                                            Spacer()
                                        }
                                        HStack{
                                            Text("\(item.bmiDescriptionValue)")
                                                .foregroundColor(fontColorForBMI(bmiValue: Double(item.bmiResult) ?? 0.0)) // Set color based on BMI
                                                .fontWeight(.bold)
                                                .padding(.horizontal)
                                            Spacer()
                                        }
                                        Text("Timestamp: \(formattedDate(from: item.timestamp))")
                                            .font(.system(size: 12))
                                            .foregroundColor(.gray)
                                            .padding(.leading)
                                            .padding(.bottom, 8)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                        
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(16)
                                }
                                
                            }
                            NavigationLink(destination: dailyActPage(gender: gender, hint: "Pick one!", options: ["Never", "Rarely", "Normal", "Frequently", "Very Often"], selection: $selectedOption))  {
                                Text("Calculate Again")
                                    .frame(width: 350, height: 50)
                                    .foregroundColor(.white)
                                    .background(Color(hex: "A3D0DD"))
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.white, lineWidth: 1)
                                    )
                            }
                            //                                Button("Delete All Data") {
                            //
                            //                                               for bmiData in items {
                            //                                                   context.delete(bmiData)
                            //                                               }
                            //
                            //                                               try? context.save()
                            //                                           }
                            
                            
                        }
                        .padding()
                        
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // Computed property for sorted items based on timestamp
    private var sortedItems: [BMIdata] {
        if isDescendingOrder {
            return items.sorted(by: { $0.timestamp > $1.timestamp })
        } else {
            return items.sorted(by: { $0.timestamp < $1.timestamp })
        }
    }
    
    var shouldShowNoHistoryMessage: Bool {
        items.isEmpty
    }

    // Function to format date
    func formattedDate(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: date)
    }

    // Function to determine font color based on BMI value
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
}

    
    var gradientColor: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color(hex: "A2D0DC"), Color.white]), startPoint: .top, endPoint: .bottom)
    }




#Preview {
    MainPage(calculatedData: .constant(""), bmrResult: .constant(0.0), bmiResult: .constant(""), idealWeight: .constant(""), bmiDescriptionValue: .constant(""), gender: "male")

}

