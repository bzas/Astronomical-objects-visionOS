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
        
    public init() {}
    
    public var body: some View {
        RealityView { content in
            if let objectEntity = await appModel.currentEntity() {
                content.add(objectEntity)
            }
        } update: { content in
            appModel.updateObjectRotation(anchorEntity: content.entities.first)
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    appModel.applyDragRotation(value)
                }
                .onEnded { _ in
                    appModel.resetDrag()
                }
                .targetedToAnyEntity()
        )
        .onAppear(perform: appModel.startAutoRotation)
        .onDisappear(perform: appModel.stopAutoRotation)
    }
}
