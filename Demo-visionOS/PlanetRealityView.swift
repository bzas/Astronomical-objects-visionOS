//
//  PlanetRealityView.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 7/12/25.
//

import SwiftUI
import RealityKit

struct PlanetRealityView: View {
        
    // MARK: - Properties
    
    var planet: Planet

    // MARK: - Rotation
    
    @State private var rotationY: Float = 0
    @State private var lastDrag = CGSize.zero
    
    
    var body: some View {
        RealityView { content in
            if let planetEntity = await planetEntity() {
                content.add(planetEntity)
            }
        } update: { content in
            updatePlanetRotation(anchorEntity: content.entities.first)
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
    
    func planetEntity() async -> AnchorEntity? {
        guard let planetEntity = try? await Entity(named: planet.modelName) else { return nil }
        
        planetEntity.scale = SIMD3(x: 0.005, y: 0.005, z: 0.005)
        planetEntity.generateCollisionShapes(recursive: true)
        planetEntity.components.set(InputTargetComponent())
        
        let anchor = AnchorEntity(world: [1, 1.3, -2])
        anchor.addChild(planetEntity)
        return anchor
    }
    
    func updatePlanetRotation(anchorEntity: Entity?) {
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
