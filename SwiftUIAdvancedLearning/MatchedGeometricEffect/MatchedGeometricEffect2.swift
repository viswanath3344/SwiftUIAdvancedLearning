//
//  MatchedGeometricEffect2.swift
//  SwiftUIAdvancedLearning
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 20/09/24.
//

import SwiftUI

struct MatchedGeometricEffect2: View {
    
    @Namespace private var nameSpace
    @State var selectedItem: String? = "One"
    
    private func isSelectedItem(item: String) -> Bool {
        selectedItem == item
    }
    
    private var items = ["One", "Two", "Three"]
    
    private func textForegroundColor(_ item: String) -> Color {
        isSelectedItem(item: item) ? .blue : .black
    }
    
    private func textFont(_ item: String) -> Font {
        isSelectedItem(item: item) ? .title.bold() : .headline
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 10) {
                ForEach(items, id: \.self) { item in
                    ZStack {
                        if isSelectedItem(item: item){
                            Rectangle()
                                .fill(.blue)
                                .frame(maxWidth: .infinity)
                                .frame(width: 40, height: 2)
                                .offset(y: 30)
                                .matchedGeometryEffect(id: "ID", in: nameSpace)
                        }
                        
                        Text(item)
                            .foregroundStyle(textForegroundColor(item))
                            .font(textFont(item))
                    }
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        withAnimation(.smooth) {
                            selectedItem = item
                        }
                    }
                }
            }.padding(.horizontal, 20)
            
            Spacer()
        }
        
    }
}

#Preview {
    MatchedGeometricEffect2()
}
