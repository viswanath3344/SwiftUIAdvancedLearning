//
//  AnyTransitionBootcamp.swift
//  SwiftUIAdvancedLearning
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 19/09/24.
//

import SwiftUI

struct RotateModifier: ViewModifier {
    let degrees: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(degrees))
            .offset(
                x: degrees != 0 ? UIScreen.main.bounds.width : 0,
                y: degrees != 0 ? UIScreen.main.bounds.height : 0
            )
    }
}

extension AnyTransition {
    static var rotating: AnyTransition {
        modifier(active: RotateModifier(degrees: 1080), identity: RotateModifier(degrees: 0))
    }
    
   static func rotating(degrees: Double) -> AnyTransition {
        modifier(
            active: RotateModifier(degrees: degrees),
            identity: RotateModifier(degrees: 0)
        )
    }
    
    static func rotateOn(degrees: Double) -> AnyTransition {
        asymmetric(
            insertion: AnyTransition.rotating(degrees: degrees),
            removal: .move(
                edge: .leading
            )
        )
     }
}

struct AnyTransitionBootcamp: View {
    @State private var showRectangle = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if showRectangle {
                RoundedRectangle(cornerRadius: 26)
                    .foregroundStyle(.purple)
                    .frame(width: 200, height: 300)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(AnyTransition.rotateOn(degrees: 180))
            }
            
            Spacer()
            
            Button("Animate") {
                withAnimation(.easeOut) {
                    showRectangle.toggle()
                }
            }.padding()
                .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    AnyTransitionBootcamp()
}
