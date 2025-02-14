//
//  _50214App.swift
//  250214
//
//  Created by 안세훈 on 2/14/25.
//

import SwiftUI

@main
struct _50214App: App {
    @State private var data = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(data)
        }
    }
}
