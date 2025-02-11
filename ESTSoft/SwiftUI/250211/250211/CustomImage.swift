//
//  CustomImage.swift
//  250211
//
//  Created by 안세훈 on 2/11/25.
//

import SwiftUI

struct CustomImage: View {
    var body: some View {
        Image("IMG")
            .resizable()
            .scaledToFit()
            .cornerRadius(30)
            .clipShape(.circle)
            .padding()
    }
}

#Preview {
    CustomImage()
}
