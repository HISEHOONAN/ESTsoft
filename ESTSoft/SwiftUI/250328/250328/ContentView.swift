//
//  ContentView.swift
//  250328
//
//  Created by 안세훈 on 3/28/25.
//

import SwiftUI

struct ContentView: View {
    // @EnvironmentObject: 외부에서 주입된 공유 ViewModel을 사용함
    // 앱의 여러 View에서 공통된 상태를 관찰하고 업데이트할 수 있음
    @EnvironmentObject var viewModel: CounterViewModel

    var body: some View {
        VStack(spacing: 20) {
            // ViewModel의 count 값을 화면에 표시
            Text("Count: \(viewModel.count)")
                .font(.largeTitle)

            // 버튼 클릭 시 count 값을 증가시킴
            Button("증가") {
                viewModel.count += 1
            }

            // NavigationLink: 버튼을 누르면 다음 화면(DetailView)으로 이동
            // DetailView에서도 동일한 viewModel을 공유함
            NavigationLink(destination: DetailView()) {
                Text("다음 화면으로 이동")
            }
        }
        .padding()
    }
}
