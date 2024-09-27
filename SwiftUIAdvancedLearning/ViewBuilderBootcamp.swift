//
//  ViewBuilderBootcamp.swift
//  SwiftUIAdvancedLearning
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 25/09/24.
//

import SwiftUI

// What if we want to inject a view as dependancy
struct HeaderViewGeneric<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            content
            
            RoundedRectangle(cornerRadius: 2.0)
                .frame(maxWidth: .infinity, maxHeight: 1.0)
                .padding(.horizontal, 20)
           
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
    }
}


struct CustomHStack<Content: View> : View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        HStack {
            content
        }
    }
}

struct ViewBuilderBootcamp: View {
    var body: some View {
        
        VStack {
            HeaderViewGeneric(title: "Viswa") {
                HStack {
                    Text("One")
                    Text("Two")
                }
            }
            
            CustomHStack {
                Text("CustomHStack 1")
                Text("CustomHStack 2")
            }
            
            HStack {
                Text("HStack 1")
                Text("HStack 2")
            }
        }
    }
}

#Preview {
    ViewBuilderBootcamp()
}
