//
//  SettingsView.swift
//  250212
//
//  Created by 안세훈 on 2/12/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Image(systemName: "gearshape.fill")
                .resizable()
                .frame(width: 50, height: 50)
            Text("Hello, Settings!")
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
