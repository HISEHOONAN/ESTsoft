//
//  SimpleTabBarView.swift
//  250212
//
//  Created by 안세훈 on 2/12/25.
//


import SwiftUI

struct SimpleTabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
        }
        .accentColor(.blue) // 탭바 아이템의 색상
    }
}

#Preview {
    SimpleTabBarView()
}