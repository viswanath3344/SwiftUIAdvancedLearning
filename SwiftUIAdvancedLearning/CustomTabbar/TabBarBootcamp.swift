//
//  TabbarBootcamp.swift
//  SwiftUIAdvancedLearning
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 27/09/24.
//

import SwiftUI

struct CustomTabBarView: View {
    let tabItems: [TabBarItem]
    @Namespace var namespace
    @Binding var selection: TabBarItem
    
    var body: some View {
        HStack {
            ForEach(tabItems, id: \.self) { tabItem in
                tabBarItem(tabItem: tabItem)
                    .onTapGesture {
                        switchToTab(tabItem: tabItem)
                    }
            }
        }.frame(minHeight: 65)
        .background(Color.white.ignoresSafeArea(edges: .leading))
        
    }
    
   private func tabBarItem(tabItem: TabBarItem) -> some View {
        VStack {
            Image(systemName: tabItem.iconName)
                .font(.subheadline)
            
            Text(tabItem.title).font(.system(size: 10, weight: .bold, design: .rounded))
        }
        .foregroundStyle(tabItem == selection ? tabItem.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(content: {
            ZStack {
                if tabItem == selection { 
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(tabItem.color.opacity(0.3))
                        .matchedGeometryEffect(id: "ID", in: namespace)
                }
            }
        })
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
    
    private func switchToTab(tabItem: TabBarItem) {
        withAnimation(.easeInOut) {
            selection = tabItem
        }
    }
}


#Preview {
    VStack {
        Spacer()
        CustomTabBarView(tabItems: [.home, .notes, .settings],
                         selection: .constant(.home)
        )
    }
}
