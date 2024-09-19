//
//  ViewModifierBootcamp.swift
//  SwiftUIAdvancedLearning
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 19/09/24.
//

import SwiftUI

struct DefaultTextModifier: ViewModifier {
    let backgroundColor: Color
    let foregroundColor: Color
    let font: Font
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .font(font)
            .foregroundStyle(foregroundColor)
            .background(backgroundColor)
            .clipShape(Capsule())
    }
}

extension View {
    func withCustomTextModifier(
        backgroundColor: Color = .red,
        font: Font = .body,
        foregroundColor: Color = .white
    ) -> some View {
        self.modifier(
            DefaultTextModifier(
                backgroundColor: backgroundColor, foregroundColor: foregroundColor,
                font: font
            )
        )
    }
}

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack(spacing: 20){
            Text("Hello, World!")
                .withCustomTextModifier(backgroundColor: .purple)
            
            Text("Welcome to iOS")
                .withCustomTextModifier(backgroundColor: .pink, font: .largeTitle)
            Text("Practice in Xcode !!!")
                .withCustomTextModifier(
                    backgroundColor: .brown,
                    font: Font.system(.largeTitle, weight: .heavy),
                    foregroundColor: .yellow
                )
                
        }.padding(.horizontal, 30)
    }
}

#Preview {
    ViewModifierBootcamp()
}
