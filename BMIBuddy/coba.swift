
//
//  History.swift
//  pawscale
//
//  Created by Viola Nikita on 30/04/24.
//

import SwiftUI

struct coba: View {
    var body: some View {
        List {
            Section(header: Text("BMI")) {
              
                
                HStack{
                    VStack {
                        HStack{
                            Text("Your Content Here")
                                .font(.system(size: 20))
                            Spacer()
                        }
                        
                        HStack{
                            Text("Your Content Here")
                                .font(.system(size: 15))
                            Spacer()
                        }
                        
                        
                    }
                    Spacer()
                }
                    
                    .frame(width: 200, height: 60)
                    .cornerRadius(10)
                }
                
                
                
            }
            .navigationBarTitle("History")
        }
     
    }
    
    
    struct coba_Previews: PreviewProvider {
        static var previews: some View {
            coba()
        }
    }

