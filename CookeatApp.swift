//
//  CookeatApp.swift
//  Cookeat
//
//  Created by Sekar Ayu Nadita on 11/04/25.
//

import SwiftUI

@main
struct CookeatApp: App {
    var body: some Scene {
        WindowGroup {
//            RecipeView()
            
                TabView{
                    RecipeView()
                        .tabItem{
                            Label("Recipe", systemImage: "safari")
                        }
                    
                    LearnCardStackView()
                        .tabItem{
                            Label("Learn", systemImage: "book")
                                
                        }
                    
                    GenerateView()
                        .tabItem{
                            Label("Generate", systemImage: "bubbles.and.sparkles")
                        }
                }.tint(.black)
        }
    }
}
