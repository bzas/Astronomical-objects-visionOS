//
//  AppModel.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 8/12/25.
//

import Combine
import Domain
import Application
import Foundation
import RealityKit
import SwiftUI

@MainActor
public final class AppModel: ObservableObject {
    
    // MARK: - Model info
        
    @Published public var object: AstronomicalObject?
    
    // MARK: - Immersive Space
    
    public static let immersiveSpaceName = "AppImmersiveSpace"
    @Published public var isImmersiveSpaceOpen = false
    
    // MARK: - Model Rotation

    @Published var rotationY: Float = 0
    @Published var lastDrag = CGSize.zero
    @Published var rotationTask: Task<Void, Never>?
    public var autoRotationSpeed: Float = -15
    
    public var isRotationPaused: Bool {
        rotationTask == nil
    }

    // MARK: - Use cases
    
    let importObjectInfoUseCase: ImportObjectInfoUseCaseProtocol
    
    // MARK: - 3D Model loader
    
    let appEntityLoader: AppEntityLoader
    
    public init(
        importObjectInfoUseCase: ImportObjectInfoUseCaseProtocol
    ) {
        self.importObjectInfoUseCase = importObjectInfoUseCase
        self.appEntityLoader = AppEntityLoader()
    }
    
    public func load() {
        Task {
            do {
                object = try await importObjectInfoUseCase.fetch(.earth)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    public func currentEntity() async -> AnchorEntity? {
        await appEntityLoader.loadEntity(object)
    }
    
    public func startAutoRotation() {
        rotationTask?.cancel()
                
        rotationTask = Task { @MainActor in
            let frameInterval = UInt64(1_000_000_000 / 60) // ~60 FPS
            let stepPerFrame = autoRotationSpeed / 60
            
            while !Task.isCancelled {
                rotationY += stepPerFrame
                try? await Task.sleep(nanoseconds: frameInterval)
            }
        }
    }
    
    public func stopAutoRotation() {
        rotationTask?.cancel()
        rotationTask = nil
    }
    
    public func updateObjectRotation(anchorEntity: Entity?) {
        guard let anchorEntity else { return }
        
        let yaw = simd_quatf(angle: rotationY * .pi / 180, axis: [0, 1, 0])
        
        for entity in anchorEntity.children {
            entity.transform.rotation = yaw
        }
    }
    
    public func applyDragRotation(_ value: DragGesture.Value) {
        let delta = CGSize(
            width: value.translation.width - lastDrag.width,
            height: value.translation.height - lastDrag.height
        )
        rotationY += Float(delta.width) / 2
        lastDrag = value.translation
    }
    
    public func resetDrag() {
        lastDrag = .zero
    }
    
    public func playOrPause() {
        if isRotationPaused {
            startAutoRotation()
        } else {
            stopAutoRotation()
        }
    }
    
    public func increaseSpeed() {
        let newSpeed = autoRotationSpeed - 20
        
        if newSpeed >= -80 {
            autoRotationSpeed = newSpeed
        } else {
            autoRotationSpeed = -20
        }
        
        startAutoRotation()
    }
}
