//
//  TabBar.swift
//  Cookeat
//
//  Created by Sekar Ayu Nadita on 11/04/25.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
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

#Preview {
    TabBar()
}
