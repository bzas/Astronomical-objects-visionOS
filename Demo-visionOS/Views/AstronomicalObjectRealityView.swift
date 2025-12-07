//
//  AstronomicalObjectRealityView.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 7/12/25.
//

import SwiftUI
import RealityKit

struct AstronomicalObjectRealityView: View {
        
    // MARK: - Properties
    
    var object: AstronomicalObject

    // MARK: - Rotation
    
    @State private var rotationY: Float = 0
    @State private var lastDrag = CGSize.zero
    
    
    var body: some View {
        RealityView { content in
            if let objectEntity = await objectEntity() {
                content.add(objectEntity)
            }
        } update: { content in
            updateObjectRotation(anchorEntity: content.entities.first)
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    applyDragRotation(value)
                }
                .onEnded { _ in
                    resetDrag()
                }
                .targetedToAnyEntity()
        )
    }
    
    func objectEntity() async -> AnchorEntity? {
        guard let objectEntity = try? await Entity(named: object.model3DInfo.modelName) else { return nil }
        
        objectEntity.scale = object.model3DInfo.scale
        objectEntity.generateCollisionShapes(recursive: true)
        objectEntity.components.set(InputTargetComponent())
        
        let anchor = AnchorEntity(world: [1, 1.3, -2])
        anchor.addChild(objectEntity)
        return anchor
    }
    
    func updateObjectRotation(anchorEntity: Entity?) {
        guard let anchorEntity else { return }
        
        let yaw = simd_quatf(angle: rotationY * .pi / 180, axis: [0, 1, 0])
        
        for entity in anchorEntity.children {
            entity.transform.rotation = yaw
        }
    }
    
    func applyDragRotation(_ value: DragGesture.Value) {
        let delta = CGSize(
            width: value.translation.width - lastDrag.width,
            height: value.translation.height - lastDrag.height
        )
        rotationY += Float(delta.width) / 2
        lastDrag = value.translation
    }
    
    func resetDrag() {
        lastDrag = .zero
    }
}
