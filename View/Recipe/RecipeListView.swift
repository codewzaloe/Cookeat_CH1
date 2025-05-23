//
//  RecipeListView.swift
//  Cookeat
//
//  Created by Sekar Ayu Nadita on 25/04/25.
//

import SwiftUI

struct RecipeListView: View {
    var category: MealsCategory
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search", text: .constant(""))
                    Image(systemName: "mic")
                        .foregroundColor(.gray)
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                
                // Recipe grid
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(category.menus) { menu in
                        NavigationLink(destination: RecipeDetailView(recipe: menu, categoryName: category.category)) {
                            RecipeCardView(recipe: menu)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle(category.category + "s")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Categories")
                    }
                    .foregroundColor(.green)
                }
            }
        }
    }
}

#Preview {
    RecipeListView(
        category: MealsCategory(
            id: 1,
            category: "pasta",
            total: "5 Recipes",
            image: "tempeh",
            background: AnyView(
                LinearGradient(
                    gradient: Gradient(colors: [Color(hex: "FFF0E0"), Color(hex: "FFCBA4")]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            ),
            menus: [
                MealMenu(
                    id: UUID(),
                    name: "Tempeh Salad",
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
                )
            ]
        )
    )
}
