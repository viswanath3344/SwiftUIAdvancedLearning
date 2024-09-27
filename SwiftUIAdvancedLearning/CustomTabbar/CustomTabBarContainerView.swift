//
//  CustomTabBarContainerView.swift
//  SwiftUIAdvancedLearning
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 27/09/24.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    @Binding<TabBarItem> var selection: TabBarItem
    
    @State private var tabs:[TabBarItem] = []
    
    let content: Content
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        _selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            content
                .ignoresSafeArea()
            
            CustomTabBarView(tabItems: tabs, selection: $selection)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 16)
            
        }.onPreferenceChange(TabBarPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

#Preview {
    CustomTabBarContainerView(selection: .constant(.home), content: {
        Color.purple
    })
}
