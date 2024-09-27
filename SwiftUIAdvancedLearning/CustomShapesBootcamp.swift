//
//  CustomShapesBootcamp.swift
//  SwiftUIAdvancedLearning
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 23/09/24.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path({ path in
            path.move(to: .init(x: rect.midX, y: rect.minY))
            path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
            path.addLine(to: .init(x: rect.minX, y: rect.maxY))
            path.addLine(to: .init(x: rect.midX, y: rect.minY))
        })
        
    }
}


struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path({ path in
            let xOffset = 25.0
            path.move(to: .init(x: rect.midX, y: rect.minY))
            path.addLine(to: .init(x: rect.maxX - xOffset, y: rect.midY))
            path.addLine(to: .init(x: rect.midX, y: rect.maxY))
            path.addLine(to: .init(x: rect.minX + xOffset, y: rect.midY))
            path.addLine(to: .init(x: rect.midX, y: rect.minY))
        })
    }
}




struct CustomShapesBootcamp: View {
    var body: some View {
        Diamond()
            .fill(Gradient(colors: [.orange, .blue, .pink]))
          //  .stroke(lineWidth: 1.0)
//            .rotation(Angle(degrees: 180))
            .frame(width: 300, height: 300)
    }
}

#Preview {
    CustomShapesBootcamp()
}
