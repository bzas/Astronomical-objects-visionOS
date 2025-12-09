//
//  AppImmersiveView.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 7/12/25.
//

import SwiftUI
import RealityKit
import AppState

public struct AppImmersiveView: View {
        
    // MARK: - Properties
    
    @EnvironmentObject var appModel: AppModel

    // MARK: - Rotation

    @State private var rotationY: Float = 0
    @State private var lastDrag = CGSize.zero
    @State private var rotationTask: Task<Void, Never>?
    
    private let autoRotationSpeedDegreesPerSecond: Float = -15
    
    public init() {}
    
    public var body: some View {
        RealityView { content in
            if let objectEntity = await appModel.currentEntity() {
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
        .onAppear(perform: startAutoRotation)
        .onDisappear(perform: stopAutoRotation)
    }
}

// MARK: - Private methods

private extension AppImmersiveView {
    
    func startAutoRotation() {
        rotationTask?.cancel()
        rotationTask = Task { @MainActor in
            let frameInterval = UInt64(1_000_000_000 / 60) // ~60 FPS
            let stepPerFrame = autoRotationSpeedDegreesPerSecond / 60
            
            while !Task.isCancelled {
                rotationY += stepPerFrame
                try? await Task.sleep(nanoseconds: frameInterval)
            }
        }
    }
    
    func stopAutoRotation() {
        rotationTask?.cancel()
        rotationTask = nil
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
