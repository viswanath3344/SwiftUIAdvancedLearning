//
//  AppTabBar.swift
//  SwiftUIAdvancedLearning
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 27/09/24.
//

import SwiftUI

struct AppTabBar: View {
    @State private var selection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $selection) {
            Color.red.tabBarItem(tabItem: .home, selection: $selection)
            
            Color.blue.tabBarItem(tabItem: .notes, selection: $selection)
            
            Color.green.tabBarItem(tabItem: .settings, selection: $selection)
        }
    }
}

#Preview {
    AppTabBar()
}
