//
//  MatchedGeometricEffectBootcamp.swift
//  SwiftUIAdvancedLearning
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 20/09/24.
//

import SwiftUI

struct MatchedGeometricEffectBootcamp: View {
    
    @State private var showRectangleUpside = true
    
    @Namespace private var nameSpace
    
    var body: some View {
        VStack {
            if showRectangleUpside {
                Rectangle().fill(Color.blue)
                    .matchedGeometryEffect(id: "ID", in: nameSpace)
                    .frame(width: 100, height: 100)
            }
            Spacer()
            
            if !showRectangleUpside {
                Circle().fill(Color.red)
                    .matchedGeometryEffect(id: "ID", in: nameSpace)
                    .frame(width: 200, height: 200)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .onTapGesture {
                withAnimation {
                    showRectangleUpside.toggle()
                }
            
        }
    }
}

#Preview {
    MatchedGeometricEffectBootcamp()
}
