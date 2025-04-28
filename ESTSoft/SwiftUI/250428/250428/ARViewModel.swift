//
//  ARViewModel.swift
//  250428
//
//  Created by 안세훈 on 4/28/25.
//


import Foundation
import RealityKit
import ARKit
import Combine

class ARViewModel: ObservableObject {
    var arView: ARView?

    func placeBox(at location: SIMD3<Float>) {
        guard let arView = arView else { return }
        let box = ModelEntity(mesh: .generateBox(size: 0.1),
            materials: [SimpleMaterial(color: .red, isMetallic: true)])
        let anchor = AnchorEntity(world: location)
        anchor.addChild(box)
        arView.scene.anchors.append(anchor)
    }

    func rotateBox() {
        guard let arView = arView else { return }
        guard let entity = arView.scene.anchors.first?.children.first else { return }
        entity.transform.rotation *= simd_quatf(angle: .pi / 4, axis: [0, 1, 0])
    }
}