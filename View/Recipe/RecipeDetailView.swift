//
//  RecipeDetailView.swift
//  Cookeat
//
//  Created by Sekar Ayu Nadita on 25/04/25.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: MealMenu
    var categoryName: String
    @State private var showIngredients = true
    @State private var isFavorite = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Recipe Image
                Image(recipe.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
                
                // Description Section
                VStack(alignment: .leading, spacing: 16) {
                    Text("Description")
                        .font(.headline)
                        .padding(.top)
                    
                    Text(recipe.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    // Recipe Info Row
                    HStack(spacing: 20) {
                        // Time
                        HStack {
                            Image(systemName: "clock")
                            Text(recipe.cookingTime)
                        }
                        
                        // Difficulty
                        HStack {
                            Image(systemName: "chart.bar")
                            Text(recipe.difficulty)
                        }
                        
                        // Servings
                        HStack {
                            Image(systemName: "person")
                            Text("\(recipe.servings) Serving")
                        }
                    }
                    .font(.subheadline)
                    .padding(.vertical)
                    
                    // Ingredients/Instructions Toggle
                    HStack {
                        Button {
                            showIngredients = true
                        } label: {
                            Text("Ingredients")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .background(showIngredients ? Color.green.opacity(0.3) : Color(.systemGray6))
                                .cornerRadius(20)
                        }
                        
                        Button {
                            showIngredients = false
                        } label: {
                            Text("Instruction")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 8)
                                .background(!showIngredients ? Color.green.opacity(0.3) : Color(.systemGray6))
                                .cornerRadius(20)
                        }
                    }
                    
                    // Content based on toggle
                    if showIngredients {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(recipe.ingredients, id: \.self) { ingredient in
                                Text(ingredient)
                            }
                        }
                    } else {
                        VStack(alignment: .leading, spacing: 16) {
                            ForEach(Array(recipe.instructions.enumerated()), id: \.element) { index, instruction in
                                HStack(alignment: .top) {
                                    Text("\(index + 1).")
                                        .font(.headline)
                                    Text(instruction)
                                }
                            }
                            
                            if !recipe.instructions.isEmpty {
                                Button {
                                    // Add action for finishing cooking
                                } label: {
                                    Text("Finish Cooking")
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.green)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .padding(.top)
                                }
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(recipe.name)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text(categoryName)
                    }
                    .foregroundColor(.green)
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isFavorite.toggle()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .green : .green)
                }
            }
        }
    }
}

#Preview {
    RecipeDetailView(
        recipe: MealMenu(
            id: UUID(),
            name: "Pasta Carbonara",
            image: "tempeh",
            description: "A creamy Italian pasta with bacon and cheese.",
            cookingTime: "30 mins",
            difficulty: "Easy",
            servings: 2,
            ingredients: ["200g pasta", "100g bacon", "2 eggs", "50g parmesan", "Salt", "Pepper"],
            instructions: [
                "Boil the pasta until al dente.",
                "Fry the bacon until crispy.",
                "Mix eggs and parmesan in a bowl.",
                "Combine all ingredients and serve."
            ]
        ),
        categoryName: "Italian"
    )
}
