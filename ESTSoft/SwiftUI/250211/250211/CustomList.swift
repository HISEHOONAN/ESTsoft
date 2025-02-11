//
//  CustomList.swift
//  250211
//
//  Created by 안세훈 on 2/11/25.
//

import SwiftUI

struct fruitView : View {
    
    var fruit : String
    
    var body: some View {
        Text(fruit)
    }
}

struct CustomList: View {
    
    let fruits = ["Apple", "Banana", "Cherry", "Mango"]
    
    var body: some View {
        NavigationView{
            List{
                ForEach(fruits, id: \.self) { fruit in
                    NavigationLink(destination: fruitView(fruit: fruit)){
                        Text(fruit)
                            .font(.title)
                            .foregroundStyle(.green)
                    }.navigationTitle("과일 목록")
                    
                }
            }
        }
        
    }
}

#Preview {
    CustomList()
}
