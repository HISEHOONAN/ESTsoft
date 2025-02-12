//
//  ViewbuilderTest.swift
//  250212
//
//  Created by 안세훈 on 2/12/25.
//

import SwiftUI

struct ViewbuilderTest: View {
    
    @ViewBuilder
    func createView(isShow: Bool) -> some View {
        if isShow == true{
            Image(systemName: "globe")
                .resizable()
                .foregroundStyle(.tint)
                .frame(width: 100, height: 100)
            Text("Hello")
        }
    }
    
    var body: some View {
        createView(isShow: true)
    }
}

#Preview {
    ViewbuilderTest()
}
