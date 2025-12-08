//
//  DetailObjectInfoView.swift
//  Demo-visionOS
//
//  Created by Alfonso Boizas Crespo on 7/12/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct DetailObjectInfoView: View {
    
    // MARK: - Properties

    @EnvironmentObject var viewModel: DetailObjectViewModel

    // MARK: - Immersive space handling
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @State private var isImmersiveSpaceOpen: Bool = false
        
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.object?.name ?? "Unknown")
                    .font(.extraLargeTitle2)
                
                Spacer()
                
                Button(isImmersiveSpaceOpen ? "Hide 3D Model" : "Show 3D Model") {
                    showOrHide()
                }
            }
            Spacer()
        }
        .padding(32)
        .onAppear() {
            Task {
                await viewModel.load()
            }
        }
    }
    
    func showOrHide() {
        Task {
            if isImmersiveSpaceOpen {
                await dismissImmersiveSpace()
                isImmersiveSpaceOpen = false
            } else {
                let result = await openImmersiveSpace(id: Constants.immersiveSpace)
                switch result {
                case .opened:
                    isImmersiveSpaceOpen = true
                case .userCancelled, .error:
                    isImmersiveSpaceOpen = false
                @unknown default:
                    isImmersiveSpaceOpen = false
                }
            }
        }
    }
}
