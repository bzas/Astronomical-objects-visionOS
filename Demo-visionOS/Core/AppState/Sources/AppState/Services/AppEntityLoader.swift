//
//  AppEntityLoader.swift
//  AppState
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

import RealityKit
import Domain

actor AppEntityLoader {
    
    @MainActor
    func loadEntity(_ object: AstronomicalObject?) async -> AnchorEntity? {
        guard let modelName = object?.model3DInfo.modelName,
              let modelScale = object?.model3DInfo.scale,
              let objectEntity = try? await Entity(named: modelName) else { return nil }
        
        objectEntity.scale = modelScale
        objectEntity.generateCollisionShapes(recursive: true)
        objectEntity.components.set(InputTargetComponent())
        
        let anchor = AnchorEntity(world: [1, 1.3, -2])
        anchor.addChild(objectEntity)
        return anchor
    }
}
