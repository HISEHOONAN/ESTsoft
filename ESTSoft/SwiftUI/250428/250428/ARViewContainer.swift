//
//  ARViewContainer.swift
//  250428
//
//  Created by 안세훈 on 4/28/25.
//


import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    @ObservedObject var viewModel: ARViewModel

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        // ViewModel에 ARView 주입 (의존성 주입)
        viewModel.arView = arView

        // ARKit 설정
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arView.session.run(config)
        arView.debugOptions = [.showFeaturePoints, .showWorldOrigin]

        // 터치 제스처 추가
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        arView.addGestureRecognizer(tapGesture)

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(viewModel: viewModel)
    }

        // SwiftUI는 기본적으로 UIKit의 제스처(UIGestureRecognizer) 같은 이벤트를 직접 처리하지 못함.
        // 그래서 UIKit 이벤트(터치, 드래그 등)를 SwiftUI와 연결해주기 위해 중간 다리 역할을 하는 객체가 필요.
    class Coordinator: NSObject {
        var viewModel: ARViewModel

        init(viewModel: ARViewModel) {
            self.viewModel = viewModel
        }

        @objc func handleTap(_ sender: UITapGestureRecognizer) {
            guard let arView = viewModel.arView else { return }
            let location = sender.location(in: arView)

            if let result = arView.raycast(from: location, allowing: .estimatedPlane, alignment: .horizontal).first {
                let position = SIMD3<Float>(result.worldTransform.columns.3.x,
                                            result.worldTransform.columns.3.y,
                                            result.worldTransform.columns.3.z)
                viewModel.placeBox(at: position)
            }
        }
    }
}
