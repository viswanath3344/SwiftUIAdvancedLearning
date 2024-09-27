//
//  TabBarPreferenceKey.swift
//  SwiftUIAdvancedLearning
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 27/09/24.
//

import Foundation
import SwiftUI

struct TabBarPreferenceKey : PreferenceKey {
    static var defaultValue: [TabBarItem] = []
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
         value += nextValue()
    }
}

struct TabBarModifier: ViewModifier {
    let tab : TabBarItem
    @Binding<TabBarItem> var selection: TabBarItem
    func body(content: Content) -> some View {
        content
            .opacity(tab == selection ? 1.0 : 0.0)
            .preference(key: TabBarPreferenceKey.self, value: [tab])
    }
}

extension View {
    func tabBarItem(tabItem: TabBarItem, selection: Binding<TabBarItem>) -> some View {
        modifier(TabBarModifier(tab: tabItem, selection: selection))
    }
}
