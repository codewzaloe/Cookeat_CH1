//
//  MealMenu.swift
//  Cookeat
//
//  Created by Sekar Ayu Nadita on 25/04/25.
//

import Foundation
import SwiftUI

struct MealMenu: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var cookingTime: String = "15 Minutes"
    var difficulty: String = "Easy"
    var servings: Int = 1
    var ingredients: [String] = []
    var instructions: [String] = []
}

struct MealsCategory: Identifiable {
    var id: Int
    var category: String
    var total: String
    var image: String
    var background: AnyView
    var menus: [MealMenu]
}

// Add your extension for sample data
extension MealsCategory {
    static func getSampleRecipes() -> [MealsCategory] {
        // Your existing data code goes here
        return [
            MealsCategory(
                id: 0,
                category: "Vegetarian",
                total: "12 Recipes",
                image: "vegetarian",
                background: AnyView(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(hex: "E6FFDB"), Color(hex: "AEF48E")]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                ),
                menus: [
                    MealMenu(
                        name: "Tempeh Salad",
                        image: "tempehsalad",
                        description: "Tempeh salad is a healthy dish made with cooked tempeh and fresh vegetables like lettuce, tomatoes, cucumbers, and avocado. It's usually dressed with olive oil and lemon juice. The tempeh provides protein, while the vegetables add crunch, making it a tasty and filling meal.",
                        ingredients: [
                            "2 TBS apple cider vinegar",
                            "1 TBS reduced sodium tamari",
                            "1/2 tsp garlic powder",
                            "1/4 tsp onion powder",
                            "8 oz block tempeh, sliced",
                            "1 TBS olive oil"
                        ],
                        instructions: [
                            "Mix together vinegar, tamari, garlic, and onion powders",
                            "Add tempeh and toss to the mixed ingredients",
                            "Heat oil in skillet and add tempeh. Cook until it starts to brown",
                            "Serve the tempeh in salads"
                        ]
                    ),
                    // Rest of your recipes
                ]
            ),
            // Rest of your categories
        ]
    }
}


