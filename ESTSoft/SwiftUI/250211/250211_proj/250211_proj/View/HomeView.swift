//
//  HomeView.swift
//  250211_proj
//
//  Created by 안세훈 on 2/11/25.
//


import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ProductListView()
                .navigationTitle("과일 마트")
        }
    }
}

#Preview {
    HomeView()
}
