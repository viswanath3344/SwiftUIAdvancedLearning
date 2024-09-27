//
//  GenericsBootcamp.swift
//  SwiftUIAdvancedLearning
//
//  Created by Ponthota, Viswanath Reddy (Cognizant) on 23/09/24.
//

import SwiftUI

struct MyData<T> {
    let item: T?
    
    func removeItem() -> MyData {
        MyData(item: nil)
    }
}

class GenericsViewModel: ObservableObject {
   @Published var data1 = MyData(item: "Hello World")
   @Published  var data2 = MyData(item: true)
    
    func removeData() {
        data1 = data1.removeItem()
        data2 = data2.removeItem()
    }
}


struct GenericsBootcamp: View {
    @StateObject var VM = GenericsViewModel()
    
    var body: some View {
        VStack {
           // Text(VM.data1.item ?? "No Data")
           // Text(VM.data2.item?.description ?? "No Data")
            
            HeaderView(content: Button("Button1", action: {}), title: "Fixed Title")
            
            HeaderView(content: Text("I am text"), title: "Fixed Title")
        }
        .onTapGesture {
            VM.removeData()
        }
    }
}

struct HeaderView <Content: View> : View {
    let content: Content
    
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
            content
        }
    }
    
    
}

#Preview {
    GenericsBootcamp()
}
