import SwiftUI

struct RecipeView: View {
    @State private var page = 0
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Let's Get Cooking!")
                    .font(.system(.title2, weight: .bold))
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("What do you want to eat today?")
                    .padding()
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "206600").opacity(0.5))

                ScrollViewReader { proxy in
                    ScrollView(.horizontal){
                        LazyHStack{
                                                     
                            ForEach(data.indices, id: \.self) { index in
                                NavigationLink(destination: RecipeListView(category: data[index])) {
                                        CardsView(page: self.$page, data: data[index], width: UIScreen.main.bounds.width)
                                    }
                                    .id(index)
                            }

                        }
                    }
                    .safeAreaPadding(.horizontal, 40)
                    .scrollTargetLayout()
                    .defaultScrollAnchor(.init(x: CGFloat(page) * 0.1, y: 0))
                    
                    PageControl(page: $page)
                        .padding(.bottom, 50)
                                .onChange(of: page) { oldValue, newValue in
                                    withAnimation {
                                        proxy.scrollTo(newValue, anchor: .center)
                                    }
                                }


                }
            }
            .scrollIndicators(.hidden)
//            .scrollTargetBehavior(.viewAligned)
            
            .navigationTitle("Hello, Fuad!")
        }
    }
}

#Preview {
    RecipeView()
}
