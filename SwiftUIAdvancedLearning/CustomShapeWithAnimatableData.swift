//
//  CustomShapeWithAnimatableData.swift
//  SwiftUIAdvancedLearning
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 23/09/24.
//

import SwiftUI


struct RectangleWithOneSideCorner: Shape {
    var cornerRadius: CGFloat
    
    var animatableData: CGFloat {
        get { cornerRadius }
        set { cornerRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path({ path in
            path.move(to: .init(x: rect.minX, y: rect.minY))
            path.addLine(to: .init(x: rect.maxX, y: rect.minY))
            path.addLine(to: .init(x: rect.maxX, y: rect.maxY-cornerRadius))
            
            path.addArc(
                center:.init(
                    x:rect.maxX-cornerRadius,
                    y:rect.maxY-cornerRadius
                ),
                radius: cornerRadius,
                startAngle: .zero,
                endAngle: Angle(degrees: 360),
                clockwise: false
            )
            
            path.addLine(to: .init(x: rect.maxX-cornerRadius, y: rect.maxY))
            path.addLine(to: .init(x: rect.minX, y: rect.maxY))
            path.addLine(to: .init(x: rect.minX, y: rect.minY))
        }
        )
    }
}

struct CustomShapeWithAnimatableData: View {
    @State var animate : Bool = false
    var body: some View {
        VStack {
           // Text("Hello, World!")
            //    .font(.largeTitle)
            RectangleWithOneSideCorner(cornerRadius: animate ? 60 : 0)
                .foregroundStyle(animate ? .purple : .blue)
                .frame(width: 300, height: 300)
        }.onAppear(perform: {
            withAnimation(.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        })
        
    }
}

#Preview {
    CustomShapeWithAnimatableData()
}
