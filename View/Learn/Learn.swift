//
//  Learn.swift
//  Cookeat
//
//  Created by Sekar Ayu Nadita on 20/04/25.
//

import SwiftUI

struct LearnCardStackView: View {
    @State private var cards: [LearnCategory] = dataLearn

    var body: some View {
        VStack(alignment: .leading) {
            Spacer().frame(height: 100)
            Text("What do you want to learn today?")
                .font(.title).bold()
                .padding(.horizontal)
            
            Spacer().frame(height: 100)
            ZStack {
                ForEach(Array(zip(cards.prefix(4).indices, cards.prefix(4))), id: \.1.id) { index, card in
                    stackedCardView(for: card, at: index)
                }
            }
            .frame(height: 260)
            .padding(.top)
            .gesture(
                DragGesture()
                    .onEnded { value in
                        let threshold: CGFloat = 50
                        withAnimation(.easeInOut(duration: 0.25)) {
                            if value.translation.height < -threshold {
                                let first = cards.removeFirst()
                                cards.append(first)
                            } else if value.translation.height > threshold {
                                let last = cards.removeLast()
                                cards.insert(last, at: 0)
                            }
                        }
                    }
            )
            Spacer()
        }
    }

    @ViewBuilder
    func stackedCardView(for card: LearnCategory, at index: Int) -> some View {
        LearnStackedCardView(category: card)
            .offset(y: CGFloat(index) * 16)
            .scaleEffect(index == 0 ? 1.0 : 0.95)
            .opacity(index == 0 ? 1.0 : 0.7)
            .zIndex(Double(4 - index))
            .animation(.easeInOut(duration: 0.20), value: cards)
    }
    
    
}

struct LearnStackedCardView: View {
    var category: LearnCategory

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("\(Int(category.progress))/\(Int(category.total))")
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .padding()

                Spacer()

                ProgressBar(progress: category.progress / category.total)
                    .frame(width: 80, height: 6)
            }
            
            Spacer()
            Text(category.articles)
                .font(.title3)
                .foregroundColor(.black.opacity(0.3))
                .fontWeight(.bold)
                .padding(.horizontal)

            Text(category.category)
                .font(.system(size: 45, weight: .bold))
                .foregroundColor(.black)
                .padding()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 350)
        .background(category.color)
        .cornerRadius(20)
        .shadow(radius: 8)
        .padding(.horizontal, 24)
    }
}

struct ProgressBar: View {
    var progress: Double

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 6)

                Capsule()
                    .fill(Color.black)
                    .frame(width: geo.size.width * CGFloat(progress), height: 6)
            }
        }
    }
}

// Model
struct LearnCategory: Identifiable, Equatable {
    var id: Int
    var category: String
    var articles: String
    var total: Double
    var progress: Double
    var color: Color
}

// Sample Data
let dataLearn: [LearnCategory] = [
    LearnCategory(id: 0, category: "Kitchen Utensils", articles: "6 Articles", total: 6, progress: 5, color: Color(hex: "E6FFDB").opacity(1.0)),
    LearnCategory(id: 1, category: "Cooking Terms", articles: "6 Articles", total: 6, progress: 4, color: Color(hex: "B6DFFE").opacity(1.0)),
    LearnCategory(id: 2, category: "Ingredients", articles: "6 Articles", total: 6, progress: 2, color: Color(hex: "FC9F9F").opacity(1.0)),
    LearnCategory(id: 3, category: "Cooking Tips", articles: "6 Articles", total: 6, progress: 1, color: Color(hex: "FCD99F").opacity(1.0)),
    LearnCategory(id: 4, category: "Meal Prep Tips", articles: "6 Articles", total: 6, progress: 0, color: Color(hex: "D4CEFF").opacity(1.0))
]

struct LearnCardStackView_Previews: PreviewProvider {
    static var previews: some View {
        LearnCardStackView()
    }
}
