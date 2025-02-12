//
//  ProfileView.swift
//  250212
//
//  Created by 안세훈 on 2/12/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
            Text("Hello, Profile!")
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
