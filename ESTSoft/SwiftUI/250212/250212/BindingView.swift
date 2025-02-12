//
//  BindingView.swift
//  250212
//
//  Created by 안세훈 on 2/12/25.
//

import SwiftUI

//여러뷰에서 사용하면 oberved
//1대1같은 경우에는 binding

struct TogleView : View {
    
    @Binding var isOn : Bool
    
    var body: some View {
        VStack{
            Toggle("토클 스위치", isOn: $isOn)
            Text("isOn: \(isOn)")
        }.padding(100)
    }
}

struct parentView: View {
    
    @State var isOn: Bool = false
    
    var body: some View {
        TogleView(isOn: $isOn)
    }
}

struct BindingView: View {
    
    var body: some View {
        parentView()
    }
}

#Preview {
    BindingView()
}
