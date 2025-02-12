//
//  ObervedObjectView.swift
//  250212
//
//  Created by 안세훈 on 2/12/25.
//

import SwiftUI

//ObservableObject 관찰 가능한 클래스임을 선언
class CountClass: ObservableObject {
    
    //@Published 다른 구조체에서 참조 가능
    @Published var count: Int = 0
    
    init(count: Int = 0) {
        self.count = count
    }
}


struct ObervedObjectView: View {
    
    //ObservedObject 관찰하는 객체 선언
    @ObservedObject var countObserver = CountClass()
    
    var body: some View {
        Text("ObervedObjectView")
            .font(.title)
            .padding()
        Text("Count : \(countObserver.count)")
            .font(.title2)
        Button("증가하기"){
            print("증가버튼 클릭댐")
            countObserver.count += 1
        }
        .padding()
    }
}

#Preview {
    ObervedObjectView()
}
