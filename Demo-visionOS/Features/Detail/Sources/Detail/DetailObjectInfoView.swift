//
//  DetailObjectInfoView.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 7/12/25.
//

import SwiftUI
import RealityKit
import RealityKitContent
import Common
import AppState

public struct DetailObjectInfoView: View {
    
    // MARK: - Properties

    @EnvironmentObject var appModel: AppModel
    
    // MARK: - Immersive space handling
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    public init() {}
        
    public var body: some View {
        VStack {
            HStack {
                Text(appModel.object?.name ?? "Unknown")
                    .font(.extraLargeTitle2)
                
                Spacer()
                
                Button(appModel.isImmersiveSpaceOpen ? "Hide 3D Model" : "Show 3D Model") {
                    showOrHide()
                }
            }
            Spacer()
        }
        .padding(32)
        .onAppear() {
            appModel.load()
        }
    }
    
    func showOrHide() {
        Task {
            if appModel.isImmersiveSpaceOpen {
                await dismissImmersiveSpace()
                appModel.isImmersiveSpaceOpen = false
            } else {
                let result = await openImmersiveSpace(id: AppModel.immersiveSpaceName)
                switch result {
                case .opened:
                    appModel.isImmersiveSpaceOpen = true
                case .userCancelled, .error:
                    appModel.isImmersiveSpaceOpen = false
                @unknown default:
                    appModel.isImmersiveSpaceOpen = false
                }
            }
        }
    }
}
