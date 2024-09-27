//
//  TabBarItem.swift
//  SwiftUIAdvancedLearning
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 27/09/24.
//

import Foundation
import SwiftUI

//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//    
//    
//   static let tabs = [
//        TabBarItem(iconName: "house", title: "Home", color: .red),
//        
//        TabBarItem(iconName: "pencil", title: "Notes", color: .blue),
//        
//        TabBarItem(iconName: "gear", title: "Settings", color: .green)
//        ]
//}


enum TabBarItem: Hashable {
    case home
    case notes
    case settings
    
    var iconName: String {
        switch self {
        case .home:
            "house"
        case .notes:
            "pencil"
        case .settings:
            "gear"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            "Home"
        case .notes:
            "Notes"
        case .settings:
            "Settings"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            .red
        case .notes:
            .blue
        case .settings:
            .green
        }
    }
}
