//
//  ButtonStyleBootcamp.swift
//  SwiftUIAdvancedLearning
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 19/09/24.
//

import SwiftUI

struct CustomButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .background(Color.pink)
            .font(.largeTitle)
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.9: 1.0)
            .shadow(radius: configuration.isPressed ? 20 : 0)
    }
}

extension View {
    func withCustomButtonStyle() -> some View {
        buttonStyle(CustomButtonStyle())
    }
}

struct ButtonStyleBootcamp: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("Click Me")
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .padding()
        }).withCustomButtonStyle()
            .padding(.horizontal , 20)
    }
}

#Preview {
    ButtonStyleBootcamp()
}
