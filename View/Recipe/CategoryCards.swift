//
//  CategoryCards.swift
//  Cookeat
//
//  Created by Sekar Ayu Nadita on 11/04/25.
//

import SwiftUI
import Foundation

struct CategoryCards: View {
    @State private var selectedPage = 0
    
    var body: some View {
        ForEach(data) { item in
            CardsView(
                page: $selectedPage,
                data: item,
                width: UIScreen.main.bounds.width - 80
            )
        }
    }
}


struct CategoryCards_Previews: PreviewProvider{
    static var previews: some View{
        CategoryCards()
    }
}


struct CList: View {
    @Binding var page: Int
    
    var body: some View {
        HStack{
            ForEach(data){i in
                CardsView(page: self.$page, data: i, width: UIScreen.main.bounds.width - 60)
                
            }
        }
    }
}

struct CardsView: View {
    @Binding var page: Int
    var data: MealsCategory
    var width: CGFloat
    
    var body: some View {
        VStack{
            VStack(alignment: .center){
                
                Spacer().frame(height:40)
                
                Text(self.data.category)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
                Text(self.data.total)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.4))
                
                Spacer().frame(height: 50)
                
                Image(data.image)
                    .resizable()
                    .frame(width: 230, height: 230)
                    .frame(maxWidth: .infinity, alignment: .center)
                Spacer().frame(height: 30)
                    
            }
            .frame(width: UIScreen.main.bounds.width - 130)
            .background(data.background)
            .cornerRadius(10)
            .shadow(radius: 9,
                    y : 4)
            .padding(.horizontal, 12)
        }

        .animation(.easeInOut(duration: 0.3), value: self.page)
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = ((int >> 24) & 0xFF, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct Carousel: UIViewRepresentable {
    
    var width: CGFloat
    @Binding var page: Int
    var height: CGFloat
    
    func makeCoordinator() -> Coordinator {
        return Carousel.Coordinator(carouselC: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let total = width * CGFloat(data.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
        
        let view1 = UIHostingController(rootView: CList(page: self.$page))
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height: self.height)
        view1.view.backgroundColor = .clear
        
        view.addSubview(view1.view)
        
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var carousel: Carousel
        
        init(carouselC: Carousel) {
            carousel = carouselC
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            
            self.carousel.page = page
        }
    }
}

struct PageControl: View {
    @Binding var page: Int

    var body: some View {
        HStack {
            ForEach(0..<5, id: \.self) { pagingIndex in
                Button {
                    withAnimation {
                        page = pagingIndex
                    }
                    print(page)
                } label: {
                    Circle()
                        .fill(page == pagingIndex ? .green : .gray)
                        .frame(width: 8, height: 8)
                }
            }
        }
    }
}

//
//struct MealsCategory: Identifiable{
//    var id: Int
//    var category: String
//    var total: String
//    var image: String
//    var background: AnyView
//    var menus: [MealMenu]
//}

var data: [MealsCategory] = [
    MealsCategory(id: 0, category: "Vegetarian", total: "12 Recipes" , image: "vegetarian", background: AnyView(
        LinearGradient(
            gradient: Gradient(colors: [Color(hex: "E6FFDB"), Color(hex: "AEF48E")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    ),
                  menus: [
                      MealMenu(name: "Tempeh Salad", image: "tempeh", description: "Fluffy and sweet with syrup."),
                      MealMenu(name: "Omelette", image: "omelette", description: "Protein-packed morning fuel.")
                  ]
),
    MealsCategory(id: 1, category: "Pasta", total: "10 Recipes" , image: "pasta", background: AnyView(
        LinearGradient(
            gradient: Gradient(colors: [Color(hex: "FCD99F"), Color(hex: "E2810C")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    ),
                  menus: [
                      MealMenu(name: "Pancakes", image: "pancakes", description: "Fluffy and sweet with syrup."),
                      MealMenu(name: "Omelette", image: "omelette", description: "Protein-packed morning fuel.")
                  ]
),
    MealsCategory(id: 2, category: "Soups", total: "12 Recipes", image: "soups", background: AnyView(
        LinearGradient(
            gradient: Gradient(colors: [Color(hex: "C0B6FE"), Color(hex: "7967EE")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    ),
                  menus: [
                      MealMenu(name: "Pancakes", image: "pancakes", description: "Fluffy and sweet with syrup."),
                      MealMenu(name: "Omelette", image: "omelette", description: "Protein-packed morning fuel.")
                  ]
),
    MealsCategory(id: 3, category: "Breakfast", total: "16 Recipes" , image: "breakfast", background: AnyView(
        LinearGradient(
            gradient: Gradient(colors: [Color(hex: "E5F4FF"), Color(hex: "81C8FF")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    ),
                  menus: [
                      MealMenu(name: "Pancakes", image: "pancakes", description: "Fluffy and sweet with syrup."),
                      MealMenu(name: "Omelette", image: "omelette", description: "Protein-packed morning fuel.")
                  ]
),
    MealsCategory(id: 4, category: "Dinner", total: "12 Recipes" , image: "dinner", background: AnyView(
        LinearGradient(
            gradient: Gradient(colors: [Color(hex: "FFC4C4"), Color(hex: "AC1919")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    ),
                  menus: [
                      MealMenu(name: "Pancakes", image: "pancakes", description: "Fluffy and sweet with syrup."),
                      MealMenu(name: "Omelette", image: "omelette", description: "Protein-packed morning fuel.")
                  ]
)
]

