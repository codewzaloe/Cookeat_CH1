//
//  RecipeCardView.swift
//  Cookeat
//
//  Created by Sekar Ayu Nadita on 25/04/25.
//

import SwiftUI

struct RecipeCardView: View {
    var recipe: MealMenu
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(recipe.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 160)
                .cornerRadius(10)
                .clipped()
            
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 2)
                
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(.white)
                    Text(recipe.cookingTime)
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
            
            .padding(8)
            .background(Color.black.opacity(0.5))
            .cornerRadius(10)
            
        }
        
        .frame(height: 160)
        .cornerRadius(10)
        .shadow(radius: 3)
        
    }
}

#Preview {
    RecipeCardView(
        recipe: MealMenu(
                    id: UUID(),
                    name: "Pasta Carbonara",
                    image: "tempeh",
                    description: "A creamy and delicious Italian pasta dish.",
                    cookingTime: "30 mins"
                    
                )
    )
}
