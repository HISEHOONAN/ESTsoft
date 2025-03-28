//
//  _50328App.swift
//  250328
//
//  Created by 안세훈 on 3/28/25.
//

import SwiftUI

@main
struct _50328App: App {
    var body: some Scene {
        WindowGroup {
            UserListView()
                .environmentObject(UserViewModel())
        }
    }
    
}
