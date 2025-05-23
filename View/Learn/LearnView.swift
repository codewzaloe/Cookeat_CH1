//
//  LearnView.swift
//  Cookeat
//
//  Created by Sekar Ayu Nadita on 11/04/25.
//

import SwiftUI

struct LearnView: View {
    @State private var page = 0
    
    var body: some View {
        VStack(alignment: .leading){
            Text("What do you want to learn today?")
                .font(.system(.title, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 80, leading: 20, bottom: 40, trailing: 0))
            Spacer()
        }
    }
}

#Preview {
    LearnView()
}
