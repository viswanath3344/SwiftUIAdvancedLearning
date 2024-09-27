//
//  CustomShapesWithArcsAndQuards.swift
//  SwiftUIAdvancedLearning
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 23/09/24.
//

import SwiftUI

struct Pokemon: Shape {
    func path(in rect: CGRect) -> Path {
        Path({
            path in
            path.move(to: .init(x: rect.midX, y: rect.midY))
            path.addArc(
                center: .init(x: rect.midX, y: rect.midY),
                radius: rect.maxX/2,
                startAngle: Angle(degrees: -20),
                endAngle: Angle(degrees: 20),
                clockwise: true
            )
            
        })
    }
}


struct WateryShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path({
            path in
            path.move(to: .init(x: rect.minX, y: rect.midY))
            path.addQuadCurve(to: .init(x: rect.midX, y: rect.midY),
                              control: .init(x: rect.width * 0.25, y: rect.height * 0.45))
            
            path.addQuadCurve(to: .init(x: rect.maxX, y: rect.midY),
                              control: .init(x: rect.width * 0.75, y: rect.height * 0.60))
            
            path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
            path.addLine(to: .init(x: rect.minX, y: rect.maxY))
        })
    }
}

struct CustomShapesWithArcsAndQuads: View {
    var body: some View {
        WateryShape()
           // .frame(width: 300, height: 300)
            .fill(Gradient(colors: [.blue, .white]))
            .ignoresSafeArea()
           
    }
}

#Preview {
    CustomShapesWithArcsAndQuads()
}
