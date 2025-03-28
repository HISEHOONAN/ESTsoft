//
//  UserRowItem.swift
//  250328
//
//  Created by 안세훈 on 3/28/25.
//


import SwiftUI

struct UserRowItem: View {
    let user: UserData

    var body: some View {
        HStack {
            Text(user.username)
                .padding(.vertical, 8)
            Spacer()
        }
    }
}
