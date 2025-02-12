//
//  EnviromentObjView.swift
//  250212
//
//  Created by 안세훈 on 2/12/25.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var username: String = "Guest"
}

struct ParentView: View {
    @StateObject var settings = UserSettings()

    var body: some View {
        ChildView().environmentObject(settings)
    }
}

struct ChildView: View {
    //@EnvironmentObject 전역적으로 사용가능
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        Text("Hello, \(settings.username)!")
            .font(.largeTitle)
    }
}

struct EnviromentObjView: View {
    var body: some View {
        ParentView()
    }
}



#Preview {
    EnviromentObjView()
}
