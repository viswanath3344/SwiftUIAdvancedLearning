//
//  PreferenceKeyBootcamp.swift
//  SwiftUIAdvancedLearning
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 20/09/24.
//

import SwiftUI

struct PreferenceKeyBootcamp: View {
    
    @State private var text = "Hello World"
    
    var body: some View {
        NavigationView {
            VStack {
                Text(text)
                    .preference(key: MyCustomPreferenceKey.self, value: "New Value !!!!")
                
                ChildView()
            }
        }
        .onPreferenceChange(MyCustomPreferenceKey.self, perform: { value in
            
            DispatchQueue.global().asyncAfter(deadline: .now() + 5.0) {
                text = value
            }
            
        })
    }
}

struct ChildView: View {
    @State private var textFromAPI = ""
    var body: some View {
        NavigationView {
            Text("Hello World")
                .onAppear(perform: getDataFromAPI)
        }
        .preference(key: MyCustomPreferenceKey.self, value: textFromAPI) // Passing data from child view to parent views. 
    }
    
    func getDataFromAPI() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            textFromAPI = "Text from API"
        }
    }
}

struct MyCustomPreferenceKey: PreferenceKey {
    static var defaultValue:String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value =  nextValue()
    }
    
}


#Preview {
    PreferenceKeyBootcamp()
}
