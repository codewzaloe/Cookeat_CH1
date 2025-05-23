//
//  GenerateView.swift
//  Cookeat
//
//  Created by Sekar Ayu Nadita on 11/04/25.
//

import SwiftUI

struct GenerateView: View {
    @State private var ingredients = ""
    var body: some View {
        VStack{
            
            VStack(alignment: .leading){
                
                Spacer().frame(height: 50)
                
                Text("Generate Your Recipe!")
                    .font(.system(.title, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding()
                Text("Create your own custom recipe by entering your ingredients!")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.gray)
//                    .padding()
               
            }
            .padding()
            
            Image("generatePic")
                .resizable()
                .frame(width:300,height: 300)
                .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Enter your ingredients")
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .bold))
                    .padding(.bottom, 4)

                TextEditor(text: $ingredients)
                    .frame(height: 100) // adjust height as needed
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                Button(action: {
                                print("Ingredients submitted: \(ingredients)")
                            }) {
                                Text("Submit")
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, maxHeight: 10)
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
            }
            .padding()
            
            
            Spacer()
            
        }
    }
}


#Preview {
    GenerateView()
}
