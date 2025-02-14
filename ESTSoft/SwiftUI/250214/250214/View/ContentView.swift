//
//  ContentView.swift
//  250214
//
//  Created by 안세훈 on 2/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView().environment(ModelData())
}    
