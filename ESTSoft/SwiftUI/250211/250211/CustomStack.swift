//
//  CustomStack.swift
//  250211
//
//  Created by 안세훈 on 2/11/25.
//

import SwiftUI

struct CustomStack: View {
    var body: some View {
        
        HStack{
            Text("hello").padding(3)
            Spacer()
            Text("world").padding(3)
        }.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
            .padding()
        
        VStack{
            Text("SwiftUI")
                .padding(10)
            Text("Layout")
        }.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
        
        ZStack{
            Text("SwiftUI 연습")
                .foregroundStyle(.white)
        }.background(Color.blue)
        
    }
}

#Preview {
    CustomStack()
}
